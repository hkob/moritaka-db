class Song < ActiveRecord::Base
  include Name
  include Renumber
  include Navi
  validates :title_id, presence:true
  before_validation do
    if self.date
      y = Year.get_or_create(self.date.year)
      self.year = y if y
    end
    true
  end
  before_destroy do
    self.can_delete?
  end
  belongs_to :title
  belongs_to :year
  belongs_to :parent, class_name: :Song
  has_many :children, class_name: :Song, foreign_key: :parent_id
  has_many :lyrics
  has_many :musics
  scope :order_yomi, -> { joins(:title).merge(Title.order_yomi) }
  scope :order_yomi_desc, -> { joins(:title).merge(Title.order_yomi_desc) }
  scope :head_value_is, -> v { joins(:title).merge(Title.head_value_is(v)) }
  scope :only_main, -> { where self.arel_table[:parent_id].eq(nil) }
  scope :date_value_is, -> v { where self.arel_table[:date].eq(v) }
  scope :after_date, -> v { where arel_table[:date].gt(v) }
  scope :before_date, -> v { where arel_table[:date].lt(v) }
  scope :order_date, -> { order arel_table[:date] }
  scope :order_date_desc, -> { order arel_table[:date].desc }
  scope :order_updated_at_desc, -> { order arel_table[:updated_at].desc }

  def can_delete?
    lyrics.count == 0 && musics.count == 0
  end

  def renumber_lyrics
    Renumber.renumber_array(self.lyrics.order_sort_order)
  end

  def renumber_musics
    Renumber.renumber_array(self.musics.order_sort_order)
  end

  def lyric_people
    self.lyrics.order_sort_order.map { |lyric| lyric.person }
  end

  def lyrics_str(flag)
    lyric_people.map { |person| person.name(flag) }.join(', ')
  end

  def music_people
    self.musics.order_sort_order.map { |music| music.person }
  end

  def musics_str(flag)
    music_people.map { |person| person.name(flag) }.join(', ')
  end

end

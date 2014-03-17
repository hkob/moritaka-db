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
    self.lyrics.count == 0 && self.musics.count == 0
  end
  belongs_to :title
  belongs_to :year
  belongs_to :parent, class_name: :Song
  has_many :children, class_name: :Song, foreign_key: :parent_id
  has_many :lyrics
  has_many :musics
  scope :order_yomi, -> { joins(:title).merge(Title.order_yomi) }
  scope :head_value_is, -> v { joins(:title).merge(Title.head_value_is(v)) }

  def can_delete?
    lyrics.count == 0
  end

  def renumber_lyrics
    Renumber.renumber_array(self.lyrics.order_sort_order)
  end

  def lyric_people
    self.lyrics.order_sort_order.map { |lyric| lyric.person }
  end

  def lyrics_str(flag)
    self.lyrics.order_sort_order.map { |lyric| lyric.person.name(flag) }.join(', ')
  end

end

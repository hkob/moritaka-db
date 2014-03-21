class Person < ActiveRecord::Base
  include Name
  include Navi
  validates :title_id, presence:true
  before_destroy do
    self.lyrics.count == 0 && self.musics.count == 0
  end
  belongs_to :title
  belongs_to :parent, class_name: :Person
  has_many :children, class_name: :Person, foreign_key: :parent_id
  has_many :lyrics
  has_many :musics
  scope :only_main, -> { where self.arel_table[:parent_id].eq(nil) }
  scope :order_yomi, -> { joins(:title).merge(Title.order_yomi) }
  scope :order_yomi_desc, -> { joins(:title).merge(Title.order_yomi_desc) }
  scope :head_value_is, -> v { joins(:title).merge(Title.head_value_is(v)) }

  def can_delete?
    lyrics.count == 0
  end

  def write_lyric?(song)
    song.lyrics.map { |l| l.person }.include?(self)
  end

  def write_music?(song)
    song.musics.map { |m| m.person }.include?(self)
  end

end

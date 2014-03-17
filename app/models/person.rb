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
  scope :order_yomi, -> { joins(:title).merge(Title.order_yomi) }
  scope :head_value_is, -> v { joins(:title).merge(Title.head_value_is(v)) }

  def can_delete?
    lyrics.count == 0
  end
end

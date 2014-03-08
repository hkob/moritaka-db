class Song < ActiveRecord::Base
  include Name
  validates :title_id, presence:true
  belongs_to :title
  belongs_to :year
  belongs_to :parent, class_name: :Song
  has_many :children, class_name: :Song, foreign_key: :parent_id
  scope :order_yomi, -> { joins(:title).merge(Title.order_yomi) }
  scope :head_value_is, -> v { joins(:title).merge(Title.head_value_is(v)) }
  before_validation do
    if self.date
      y = Year.get_or_create(self.date.year)
      self.year = y if y
    end
    true
  end

  def can_delete?
    true
  end
end

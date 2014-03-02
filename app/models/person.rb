class Person < ActiveRecord::Base
  include Name
  validates :title_id, presence:true
  belongs_to :title
  belongs_to :parent, class_name: :Person
  has_many :children, class_name: :Person, foreign_key: :parent_id
  scope :order_yomi, -> { joins(:title).merge(Title.order_yomi) }
  scope :head_value_is, -> v { joins(:title).merge(Title.head_value_is(v)) }

  def head1
    title.head[0]
  end

  def can_delete?
    true
  end
end

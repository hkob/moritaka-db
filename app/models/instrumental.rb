class Instrumental < ActiveRecord::Base
  include Name
  include Renumber
  include Navi
  validates :sort_order, :title_id, presence:true
  belongs_to :title
  scope :order_sort_order, -> { order self.arel_table[:sort_order] }
  scope :english_value_is, -> v { joins(:title).merge(Title.english_value_is(v)) }

  def self.renumber
    Renumber.renumber_array(self.order_sort_order)
  end

  def can_delete?
    true
  end
end

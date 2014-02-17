class Instrumental < ActiveRecord::Base
  include Name
  validates :sort_order, :title_id, presence:true
  belongs_to :title
  scope :order_sort_order, -> { order self.arel_table[:sort_order] }
  scope :english_value_is, -> v { joins(:title).merge(Title.english_value_is(v)) }

  def self.renumber
    self.order_sort_order.each_with_index do |obj, i|
      count = (i + 1) * 10
      unless obj.sort_order == count
        obj.sort_order = count
        obj.save
      end
    end
  end

  def can_delete?
    true
  end
end

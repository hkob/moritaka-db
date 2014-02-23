class Year < ActiveRecord::Base
  validates :year, presence:true
  scope :order_year, -> { order self.arel_table[:year] }

  def name(flag)
    flag ? "#{year} 年" : "in #{year}"
  end

  def can_delete?
    true
  end
end

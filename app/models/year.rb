class Year < ActiveRecord::Base
  include Navi
  validates :year, presence:true
  scope :year_value_is, -> v { where self.arel_table[:year].eq(v) }
  scope :order_year, -> { order self.arel_table[:year] }
  has_many :songs
  before_destroy do
    self.songs.count == 0
  end

  def name(flag)
    flag ? "#{year} 年" : "in #{year}"
  end

  def can_delete?
    songs.count == 0
  end

  def self.get_or_create(y)
    Year.year_value_is(y).first_or_create
  end
end

class Title < ActiveRecord::Base
  include YomiSuuji
  validates :japanese, :english, :yomi, :yomi_suuji, presence:true
  validates :yomi, format: { with: /\A[\p{Hiragana}ー・　]+\z/, allow_blank: true }
  before_validation do
    self.yomi_suuji = self.yomi.split('　').map { |str| convert_yomi_suuji(str) }.join('-')
  end
  before_destroy do
    self.instrumental == nil
  end
  has_one :instrumental
  scope :head_value_is, -> v { where self.arel_table[:yomi_suuji].matches("#{v}%") }
  scope :order_yomi, -> { order self.arel_table[:yomi_suuji] }
  scope :english_value_is, -> v { where self.arel_table[:english].eq(v) }

  def head
    yomi_suuji[0..1]
  end

  def name(flag)
    flag ? japanese : english
  end

  def can_delete?
    instrumental ? false : true
  end
end

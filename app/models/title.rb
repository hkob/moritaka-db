class Title < ActiveRecord::Base
  include YomiSuuji
  include Name
  include Navi
  validates :japanese, :english, :yomi, :yomi_suuji, presence:true
  validates :yomi, format: { with: /\A[\p{Hiragana}ー・　]+\z/, allow_blank: true }
  before_validation do
    self.yomi_suuji = self.yomi.split('　').map { |str| convert_yomi_suuji(str) }.join('-')
  end
  before_destroy do
    self.instrumental == nil && self.person == nil && self.song == nil
  end
  has_one :instrumental
  has_one :person
  has_one :song
  scope :head_value_is, -> v { where self.arel_table[:yomi_suuji].matches("#{v}%") }
  scope :order_yomi, -> { order self.arel_table[:yomi_suuji] }
  scope :order_yomi_desc, -> { order self.arel_table[:yomi_suuji].desc }
  scope :japanese_value_is, -> v { where self.arel_table[:japanese].eq(v) }
  scope :english_value_is, -> v { where self.arel_table[:english].eq(v) }
  scope :after_yomi, -> v { where self.arel_table[:yomi_suuji].gt(v) }
  scope :before_yomi, -> v { where self.arel_table[:yomi_suuji].lt(v) }

  def title
    self
  end

  def head
    yomi_suuji[0..1]
  end

  def name(flag)
    flag ? japanese : english
  end

  def can_delete?
    instrumental || person || song ? false : true
  end
end

class Title < ActiveRecord::Base
  include YomiSuuji
  validates :japanese, :english, :yomi, :yomi_suuji, presence:true
  validates :yomi, format: { with: /\A[\p{Hiragana}ー・　]+\z/, allow_blank: true }
  before_validation do
    self.yomi_suuji = self.yomi.split('　').map { |str| convert_yomi_suuji(str) }.join('-')
  end
end

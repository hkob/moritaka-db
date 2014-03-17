require 'spec_helper'

describe Year do
  let(:year) { FactoryGirl.build(:year) }

  it '妥当なオブジェクトが生成されること' do
    expect(year).to be_valid
  end

  [ :year ].each do |key|
    it "#{key} は空であってはならない" do
      year[key] = ""
      expect(year).not_to be_valid
      expect(year.errors[key]).to be_present
    end
  end

  it "name(flag) にて西暦の日本語・英語表示が行えること" do
    expect(year.name(true)).to eq('1987 年')
    expect(year.name(false)).to eq('in 1987')
  end

  it "navi_index_str にてタイトル文字列が取得できること" do
    expect(year.navi_index_str("ABC")).to eq(I18n.t('years.index.title') + '(ABC)')
    expect(year.navi_index_str).to eq(I18n.t('years.index.title'))
  end

end

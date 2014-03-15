require 'spec_helper'

describe Title do
  let(:title) { FactoryGirl.build(:title) }

  it '妥当なオブジェクトが生成されること' do
    expect(title).to be_valid
  end

  [ :japanese, :english, :yomi ].each do |key|
    it "#{key} は空であってはならない" do
      title[key] = ""
      expect(title).not_to be_valid
      expect(title.errors[key]).to be_present
    end
  end

  it "yomi_suuji が正しく設定できること" do
    title.valid?
    expect(title.yomi_suuji).to eq('41549514.0001-030114.001')
    title.yomi = [*"ぁ".."ゖ"].join("　") + "　ー・"
    title.valid?
    expect(title.yomi_suuji).to eq('00.0-00.0-01.0-01.0-02.0-02.0-03.0-03.0-04.0-04.0-10.0-10.1-11.0-11.1-12.0-12.1-13.0-13.1-14.0-14.1-20.0-20.1-21.0-21.1-22.0-22.1-23.0-23.1-24.0-24.1-30.0-30.1-31.0-31.1-32.0-32.0-32.1-33.0-33.1-34.0-34.1-40.0-41.0-42.0-43.0-44.0-50.0-50.1-50.2-51.0-51.1-51.2-52.0-52.1-52.2-53.0-53.1-53.2-54.0-54.1-54.2-60.0-61.0-62.0-63.0-64.0-70.0-70.0-72.0-72.0-74.0-74.0-80.0-81.0-82.0-83.0-84.0-90.0-90.0-91.0-93.0-94.0-95.0-52.1-10.0-13.0-9999.00')
  end

  it "読みにひらがなと設定された記号以外の文字が設定されていた場合にエラーとなること" do
    title.yomi = "日本語"
    expect(title).not_to be_valid
    expect(title.errors[:yomi]).to be_present
  end

  it "head にて yomi_suuji の先頭二文字が取得できること" do
    title.valid?
    expect(title.head).to eq('41')
  end

  it "name(flag) にて対応する言語の文字列が得られること" do
    expect(title.name(true)).to match('日本語　英語_\d')
    expect(title.name(false)).to eq('English Japanese')
  end

end

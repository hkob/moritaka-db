require 'spec_helper'

describe Instrumental do
  let(:instrumental) { FactoryGirl.build(:instrumental) }

  it '妥当なオブジェクトが生成されること' do
    expect(instrumental).to be_valid
  end

  [ :sort_order, :title_id ].each do |key|
    it "#{key} は空であってはならない" do
      instrumental[key] = ""
      expect(instrumental).not_to be_valid
      expect(instrumental.errors[key]).to be_present
    end
  end

  it "削除したときに対応するタイトルの楽器のリンクが消えること" do
    instrumental.save
    title = instrumental.title
    expect(title.instrumental).to eq(instrumental)
    instrumental.destroy
    expect(title.instrumental(true)).to be_nil
  end

  it "楽器が所属するタイトルが削除できないこと" do
    instrumental.save
    title = instrumental.title
    expect { title.destroy }.not_to change(Title, :count)
  end

  it "name(flag) にてタイトルが取得できること" do
    expect(instrumental.name(true)).to match('日本語　英語_\d')
    expect(instrumental.name(false)).to eq('English Japanese')
  end

  it "navi_index_str にてタイトル文字列が取得できること" do
    expect(instrumental.navi_index_str).to eq(I18n.t 'instrumentals.index.title')
  end
end

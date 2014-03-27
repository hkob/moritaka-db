require 'spec_helper'

describe Album do
  let(:album) { FactoryGirl.build(:album) }

  it '妥当なオブジェクトが生成されること' do
    expect(album).to be_valid
  end

  [ :title_id, :device_type ].each do |key|
    it "#{key} は空であってはならない" do
      album[key] = ""
      expect(album).not_to be_valid
      expect(album.errors[key]).to be_present
    end
  end

  it "削除したときに対応するタイトルのアルバムのリンクが消えること" do
    album.save
    title = album.title
    expect(title.album).to eq(album)
    album.destroy
    expect(title.album(true)).to be_nil
  end

  it "曲が所属するタイトルが削除できないこと" do
    album.save
    title = album.title
    expect { title.destroy }.not_to change(Title, :count)
  end
end

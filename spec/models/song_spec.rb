require 'spec_helper'

describe Song do
  let(:song) { FactoryGirl.build(:song) }

  it '妥当なオブジェクトが生成されること' do
    expect(song).to be_valid
  end

  [ :title_id ].each do |key|
    it "#{key} は空であってはならない" do
      song[key] = ""
      expect(song).not_to be_valid
      expect(song.errors[key]).to be_present
    end
  end

  it "削除したときに対応するタイトルの曲のリンクが消えること" do
    song.save
    title = song.title
    expect(title.song).to eq(song)
    song.destroy
    expect(title.song(true)).to be_nil
  end

  it "曲が所属するタイトルが削除できないこと" do
    song.save
    title = song.title
    expect { title.destroy }.not_to change(Title, :count)
  end
end

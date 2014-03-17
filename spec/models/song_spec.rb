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

  it "head_str にて頭文字が取得できること" do
    expect(song.head_str(true)).to eq('に')
    expect(song.head_str(false)).to eq('NI')
  end

  it "head1_str にて頭文字の範囲が取得できること" do
    expect(song.head1_str(true)).to eq('な - の')
    expect(song.head1_str(false)).to eq('NA - NO')
  end

  it "navi_index_str にてタイトル文字列が取得できること" do
    expect(song.navi_index_str("ABC")).to eq(I18n.t('songs.index.title') + '(ABC)')
    expect(song.navi_index_str).to eq(I18n.t('songs.index.title'))
  end

  it "navi_show_str にてタイトル文字列が取得できること" do
    expect(song.navi_show_str(true)).to match(I18n.t('songs.show.title') + '\(日本語　英語_\d\)')
  end

  it "navi_edit_str にてタイトル文字列が取得できること" do
    expect(song.navi_edit_str(true)).to match(I18n.t('songs.edit.title') + '\(日本語　英語_\d\)')
  end
end

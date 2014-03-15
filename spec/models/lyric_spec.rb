require 'spec_helper'

describe Lyric do
  let(:lyric) { FactoryGirl.build(:lyric) }

  it '妥当なオブジェクトが生成されること' do
    expect(lyric).to be_valid
  end

  [ :song_id, :person_id ].each do |key|
    it "#{key} は空であってはならない" do
      lyric[key] = ""
      expect(lyric).not_to be_valid
      expect(lyric.errors[key]).to be_present
    end
  end

  it "削除したときに対応する曲の作詞のリンクが消えること" do
    lyric.save
    song = lyric.song
    expect(song.lyrics).to include(lyric)
    expect { lyric.destroy }.to change(song.lyrics, :count).by(-1)
  end

  it "削除したときに対応する人の作詞のリンクが消えること" do
    lyric.save
    person = lyric.person
    expect(person.lyrics).to include(lyric)
    expect { lyric.destroy }.to change(person.lyrics, :count).by(-1)
  end

  it "作詞が所属する曲が削除できないこと" do
    lyric.save
    expect { lyric.song.destroy }.not_to change(Song, :count)
  end

  it "作詞が所属する曲が削除できないこと" do
    lyric.save
    expect { lyric.person.destroy }.not_to change(Person, :count)
  end
end

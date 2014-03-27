require 'spec_helper'

describe Music do
  let(:music) { FactoryGirl.build(:music) }

  it '妥当なオブジェクトが生成されること' do
    expect(music).to be_valid
  end

  [ :song_id, :person_id ].each do |key|
    it "#{key} は空であってはならない" do
      music[key] = ""
      expect(music).not_to be_valid
      expect(music.errors[key]).to be_present
    end
  end

  it "削除したときに対応する曲の作曲のリンクが消えること" do
    music.save
    song = music.song
    expect(song.musics).to include(music)
    expect { music.destroy }.to change(song.musics, :count).by(-1)
  end

  it "削除したときに対応する人の作曲のリンクが消えること" do
    music.save
    person = music.person
    expect(person.musics).to include(music)
    expect { music.destroy }.to change(person.musics, :count).by(-1)
  end

  it "作曲が所属する曲が削除できないこと" do
    music.save
    expect { music.song.destroy }.not_to change(Song, :count)
  end

  it "作曲が所属する人が削除できないこと" do
    music.save
    expect { music.person.destroy }.not_to change(Person, :count)
  end
end


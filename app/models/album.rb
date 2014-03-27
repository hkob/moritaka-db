class Album < Device
  validates :title_id, :device_type, presence:true

  AlbumStr2Num = { album:1, mini_album:2, karaoke_cd:4, lyric_album:8, music_album:16, cover_album:32, part_album:64, compilation_album:128 }
  AlbumNum2Str = AlbumStr2Num.invert

  def self.num2str
    AlbumNum2Str
  end

  def self.str2num
    AlbumStr2Num
  end
end

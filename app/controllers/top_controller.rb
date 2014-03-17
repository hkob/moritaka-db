class TopController < ApplicationController
  def index
    @tables = [
      [ Title, 'link.titles' ],
      [ Instrumental, 'link.instrumentals' ],
      [ Person, 'link.people' ],
      [ Song, 'link.songs' ],
      [ Lyric, 'link.lyrics' ],
      [ Music, 'link.musics' ],
    ]
  end
end

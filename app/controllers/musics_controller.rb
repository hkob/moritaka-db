class MusicsController < ApplicationController
  include Head
  before_action :reject_production, except:[ :index, :show ]
  before_action :get_music, only:[ :edit, :update, :destroy, :show ]

  def new
    @song, @ids = get_objects_and_ids [ Song ], false
    @head, @heads, @lhead_hash, @head_str, @ids = get_heads(params[:head], @is_ja)
    @people = Person.head_value_is(@head).order_yomi
    @sort_order = (@song.musics.count + 1) * 10
    @subtitle = @song.name(@is_ja)
    @exist_hash = @song.musics.map { |l| [ l.person, l ] }.to_h || {}
  end

  def create
    @music = Music.create(music_params)
    redirect_to edit_song_path(@music.song, head:@music.person.head1)
  end

  def edit
    @subtitle = @music.name(@is_ja)
    @song = @music.song
  end

  def update
    if @music.update(music_params)
      @song = @music.song
      @song.renumber_musics
      redirect_to edit_song_path(@song, head:@music.person.head1)
    else
      render action: :edit
    end
  end

  def destroy
    @song = @music.song
    @person = @music.person
    @music.destroy
    @song.renumber_musics
    redirect_to edit_song_path(@song, head:@person.head1)
  end

  def get_music
    @music, @ids = get_objects_and_ids [ Music ]
  end
  private :get_music

  def music_params
    params.require(:music).permit(:song_id, :person_id, :sort_order)
  end
  private :music_params
end

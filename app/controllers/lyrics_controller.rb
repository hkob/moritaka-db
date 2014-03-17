class LyricsController < ApplicationController
  include Head
  before_action :reject_production, except:[ :index, :show ]
  before_action :get_lyric, only:[ :edit, :update, :destroy, :show ]

  def new
    @song, @ids = get_objects_and_ids [ Song ], false
    @head, @heads, @lhead_hash, @head_str, @ids = get_heads(params[:head], @is_ja)
    @people = Person.head_value_is(@head).order_yomi
    @sort_order = (@song.lyrics.count + 1) * 10
    @subtitle = @song.name(@is_ja)
    @exist_hash = @song.lyrics.map { |l| [ l.person, l ] }.to_h || {}
  end

  def create
    @lyric = Lyric.create(lyric_params)
    redirect_to edit_song_path(@lyric.song, head:@lyric.person.head1)
  end

  def edit
    @subtitle = @lyric.name(@is_ja)
    @song = @lyric.song
  end

  def update
    if @lyric.update(lyric_params)
      @song = @lyric.song
      @song.renumber_lyrics
      redirect_to edit_song_path(@song.id, head:@lyric.person.head1)
    else
      render action: :edit
    end
  end

  def destroy
    @song = @lyric.song
    @person = @lyric.person
    @lyric.destroy
    @song.renumber_lyrics
    redirect_to edit_song_path(@song, head:@person.head1)
  end

  def get_lyric
    @lyric, @ids = get_objects_and_ids [ Lyric ]
  end
  private :get_lyric

  def lyric_params
    params.require(:lyric).permit(:song_id, :person_id, :sort_order)
  end
  private :lyric_params
end

class SongsController < ApplicationController
  include Head
  before_action :reject_production, except:[ :index, :show ]
  before_action :get_song, only:[ :edit, :update, :destroy, :show ]
  def index
    @head, @heads, @lhead_hash, @head_str, @ids = get_heads(params[:head], @is_ja)
    @songs = Song.head_value_is(@head).order_yomi
  end

  def new
    @title, @ids = get_objects_and_ids [ Title], false
    @song = Song.new(title_id:@title.id)
  end

  def create
    @song = Song.new(song_params)
    @title = @song.title
    if @song.save
      redirect_to songs_path(head:@song.head1)
    else
      render action: :new
    end
  end

  def edit
    @head, @heads, @lhead_hash, @head_str, @ids = get_heads(params[:head], @is_ja)
    @songs = Song.head_value_is(@head).order_yomi
    @ids[:song_id] = @song.id
  end

  def update
    @song.update(song_params)
    @parent = @song.parent
    redirect_to songs_path(head:@parent ? @parent.head1 : @song.head1)
  end

  def destroy
    @haed1 = @song.head1
    @song.destroy
    redirect_to songs_path(head:@head1)
  end

  def get_song
    @song, @ids = get_objects_and_ids [ Song ]
  end
  private :get_song

  def song_params
    params.require(:song).permit(:date, :title_id, :parent_id)
  end
  private :song_params
end

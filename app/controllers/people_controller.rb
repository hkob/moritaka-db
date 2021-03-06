class PeopleController < ApplicationController
  include Head
  before_action :reject_production, except:[ :index, :show ]
  before_action :get_person, only:[ :edit, :update, :destroy, :show ]
  def index
    @head, @heads, @lhead_hash, @subtitle, @ids = get_heads(params[:head], @is_ja)
    @people = Person.head_value_is(@head).order_yomi
  end

  def create
    @person = Person.new(person_params)
    @title = @person.title
    @person.save
    redirect_to people_path(head:@person.head1)
  end

  def edit
    @head, @heads, @lhead_hash, @head_str, @ids = get_heads(params[:head], @is_ja)
    @people = Person.head_value_is(@head).order_yomi
    @ids[:person_id] = @person.id
    @subtitle = @person.name(@is_ja)
  end

  def update
    @person.update(person_params)
    @parent = @person.parent
    redirect_to people_path(head:@parent ? @parent.head1 : @person.head1)
  end

  def destroy
    @haed1 = @person.head1
    @person.destroy
    redirect_to people_path(head:@head1)
  end

  def show
    @subtitle = @person.names(@is_ja)
    @lyric_songs = @person.lyrics.order_song_date.map { |l| l.song }
    @music_songs = @person.musics.order_song_date.map { |l| l.song }
    @mode = params[:mode]
    @mode ||= @lyric_songs.count > 0 ? 'lyrics' : @music_songs.count > 0 ? 'musics' : ''
    @headers = case @mode
               when 'lyrics', 'musics'
                 I18n.t %w(songs lyrics musics), scope:'link'
               else
                   []
               end
    @objects = case @mode
               when 'lyrics'
                 @lyric_songs
               when 'musics'
                 @music_songs
               end
  end

  def get_person
    @person, @ids = get_objects_and_ids [ Person ]
  end
  private :get_person

  def person_params
    params.require(:person).permit(:title_id, :parent_id)
  end
  private :person_params
end

class AlbumsController < ApplicationController
  include Head
  before_action :reject_production, except:[ :index, :show ]
  before_action :get_album, only:[ :edit, :update, :destroy, :show ]

  def index
    @device_type = (dt = params[:device_type]) ? dt.to_i : 1
    @albums = Album.device_type_value_has(@device_type).include_title.order_year_date
    @asn = Album::AlbumStr2Num
    @ans = Album::AlbumNum2Str
    @subtitle = I18n.t "device_type.#{@ans[@device_type]}"
  end

  def new
    @title, @ids = get_objects_and_ids [ Title ], false
    @album = Album.new(title_id:@title.id)
    @subtitle = @title.name(@is_ja)
  end

  def create
    @album = Album.new(album_params)
    @title = @album.title
    if @album.save
      redirect_to edit_album_path(@album, head:@album.head1)
    else
      render action: :new
    end
  end

  def edit
    @subtitle = @album.name(@is_ja)
    @head, @heads, @lhead_hash, @subtitle2, @ids2 = get_heads(params[:head], @is_ja)
    @people = Person.head_value_is(@head).order_yomi
    @ids.merge!(@ids2)
  end

  def get_album
    @album, @ids = get_objects_and_ids [ Album ]
  end
  private :get_album

  def update
    @album.update(album_params)
    @device_type = @album.first_device_type
    redirect_to albums_path(device_type:@device_type)
  end

  def destroy
    @device_type = @album.first_device_type
    @album.destroy
    redirect_to albums_path(device_type:@device_type)
  end

  def show
    @subtitle = @album.name(@is_ja)
  end

  def album_params
    params.require(:album).permit(:device_type, :date, :number, :title_id, :minutes, :seconds, :j_comment, :e_comment, :singer_id)
  end
  private :album_params
end

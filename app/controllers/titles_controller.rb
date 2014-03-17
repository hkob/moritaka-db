class TitlesController < ApplicationController
  before_action :reject_production, except:[ :index, :show ]
  before_action :get_title, only:[ :edit, :update, :destroy, :show ]

  def index
    @head = params[:head]
    @head = "00" unless /^\d\d$/ =~ @head
    @titles = Title.head_value_is(@head).order_yomi
    @heads = @is_ja ? JHeads : EHeads
    @lhead_hash = @heads.flatten.zip(LHeads).to_h
    @subtitle = @lhead_hash.invert[@head]
    @ids = { head:@head }
  end

  def new
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)
    if @title.save
      redirect_to titles_path(head:@title.head)
    else
      render action: :new
    end
  end

  def edit
    @subtitle = @title.name(@is_ja)
  end

  def update
    if @title.update(title_params)
      redirect_to titles_path(head:@title.head)
    else
      render action: :edit
    end
  end

  def destroy
    head = @title.head
    @title.destroy
    redirect_to titles_path(head:head)
  end

  def show
    @subtitle = @title.name(@is_ja)
  end

  def get_title
    @title, @ids = get_objects_and_ids [ Title ]
  end
  private :get_title

  def title_params
    params.require(:title).permit(:japanese, :english, :yomi)
  end
  private :title_params
end

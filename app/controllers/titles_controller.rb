class TitlesController < ApplicationController
  before_action :reject_production, except:[ :index, :show ]
  before_action :get_title, only:[ :edit, :update, :destroy, :show ]

  def index
    @head = params[:head]
    @head = "00" unless /^\d\d$/ =~ @head
    @titles = Title.head_value_is(@head).order_yomi
    @heads = @is_ja ? JHeads : EHeads
    @lhead_hash = @heads.zip(JHeads.map { |fl| convert_yomi_suuji(fl).slice(0..1) }).to_h
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

  def get_title
    @title, @ids = get_objects_and_ids [ Title ]
  end
  private :get_title

  def title_params
    params.require(:title).permit(:japanese, :english, :yomi)
  end
  private :title_params
end

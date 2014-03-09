class InstrumentalsController < ApplicationController
  before_action :reject_production, except:[ :index, :show ]
  before_action :get_instrumental, only:[ :edit, :update, :destroy, :show ]
  def index
    @instrumentals = Instrumental.order_sort_order
  end

  def create
    @instrumental = Instrumental.new(instrumental_params)
    @title = @instrumental.title
    @instrumental.save
    redirect_to instrumentals_path
  end

  def edit
    @subtitle = @instrumental.name(@is_ja)
  end

  def update
    if @instrumental.update(instrumental_params)
      Instrumental.renumber
      redirect_to instrumentals_path
    else
      render action: :edit
    end
  end

  def destroy
    @instrumental.destroy
    Instrumental.renumber
    redirect_to instrumentals_path
  end

  def show
    @subtitle = @instrumental.name(@is_ja)
  end

  def get_instrumental
    @instrumental, @ids = get_objects_and_ids [ Instrumental ]
  end
  private :get_instrumental

  def instrumental_params
    params.require(:instrumental).permit(:sort_order, :title_id)
  end
  private :instrumental_params
end

class YearsController < ApplicationController
  before_action :reject_production, except:[ :index, :show ]
  before_action :get_year, only:[ :destroy, :show ]

  def index
    @years = Year.order_year
  end

  def new
    @year = Year.new
  end

  def create
    @year = Year.new(year_params)
    if @year.save
      redirect_to years_path
    else
      render action: :new
    end
  end

  def destroy
    @year.destroy
    redirect_to years_path
  end

  def get_year
    @year, @ids = get_objects_and_ids [ Year ]
  end
  private :get_year

  def year_params
    params.require(:year).permit(:year)
  end
  private :year_params
end

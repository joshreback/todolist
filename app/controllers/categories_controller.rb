class CategoriesController < ApplicationController

  wrap_parameters format: [:json]

  def index
    ### Extremely temporary ###
    @categories = User.find(1).categories

    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: @categories, status: :ok }
    end
  end

  def create
    params = categories_params

    ### Extremely temporary ###
    @category = Category.new(name: params[:name], user_id: 1)

    if @category.save
      respond_to do |format|
        format.json { render json: @category, status: :ok }
      end
    end
  end

  def show
  end

  def update
  end

  def delete
  end

  private 

  def categories_params
    params.require(:category).permit(:name)
  end
end

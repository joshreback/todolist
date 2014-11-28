class CategoriesController < ApplicationController

  wrap_parameters format: [:json]

  def index
    @categories = current_user.categories

    respond_to do |format|
      format.html { render action: 'index' }
    end
  end

  def create
    params = categories_params

    @category = Category.new(name: params[:name], user_id: current_user.id)

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

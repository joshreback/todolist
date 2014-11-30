class CategoriesController < ApplicationController

  wrap_parameters format: [:json]

  # Public: Lists all categories & associated todos of the current user
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

  # Public: Destroys a category from the database
  def destroy
    @category = Category.find_by_id params[:id]
    @category.destroy()
    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end

  private 

  def categories_params
    params.require(:category).permit(:name)
  end
end

class CategoriesController < ApplicationController

  wrap_parameters format: [:json]

  def index
    ### Extremely temporary ###
    u = User.find 1

    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: u.categories, status: :ok }
    end
  end

  def create
    params = categories_params

    ### Extremely temporary ###
    @category = Category.new(name: params[:name], user_id: 1)

    if @category.save
      respond_to do |format|
        format.json {
          flash[:notice] = "The category #{@category.name} was successfully created."
          redirect_to root_url
        }
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

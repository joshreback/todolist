class CategoriesController < ApplicationController

  wrap_parameters format: [:json]

  # Public: Lists all categories & associated todos of the current user
  def index
    @categories = current_user.categories

    respond_to do |format|
      format.html { render action: 'index' }
    end
  end

  # Public: Creates a new category for the current_user
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
    @category = Category.find params[:id]
    @category.destroy()
    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end

  # Public: Returns the todos associated with this particular category.
  def todos
    category = Category.find params[:category_id]
    if params[:yesterday]
      todos = category.yesterdays_todos
    else 
      todos = category.todays_todos
    end
    
    respond_to do |format|
      format.json { render json: todos, status: :ok }
    end
  end

  def calendar
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
  
  private 

  def categories_params
    params.require(:category).permit(:name, :id)
  end
end

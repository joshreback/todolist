class CategoriesController < ApplicationController

  # Public: Lists all categories & associated todos of the current user
  def index
    @categories = current_user.active_categories
    respond_to :html
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

  # Public: Updates a category (for now, by marking as inactive)
  def update
    @category = Category.find params[:id]
    @category.mark_as_inactive if !params[:active]
    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end

  # Public: Returns the todos associated with a particular category.
  def todos
    category = Category.find params[:category_id]

    opts = {}
    opts[:timestamp]        = params[:day_timestamp].to_i
    opts[:incomplete_only]  = params[:incomplete_only] if params[:incomplete_only]

    if opts[:create_new_todos]
      todos = Todo.create_todos_for_today todos, category.id
    else
      todos = category.todos_by_day opts  # Fetch todos for today
    end

    respond_to do |format|
      format.json { render json: todos, status: :ok }
    end
  end

  # Renders the calendar page
  def calendar
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # Renders a "snapshot" of what a user accomplished on a certain day
  def snapshot
    @snapshot_of_day = current_user.snapshot params[:day_timestamp]
    respond_to :html
  end
  
  private 

  def categories_params
    params.require(:category).permit(:name, :id, :day_timestamp)
  end
end

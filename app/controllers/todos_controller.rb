class TodosController < ApplicationController

  # Probably not the best place for this, come to think of it
  def index
    @snapshot_of_day = Todo.snapshot 1418423872516 # params[:day]

    respond_to do |format|
      format.json { render :index}
    end
  end

  def create
    params = todos_params

    todo = Todo.new todos_params

    if todo.save
      respond_to do |format|
        format.json { render json: todo, status: :ok }
      end
    end
  end

  def update
    params = todos_params
    
    todo = Todo.find params[:id]
    todo.update params

    respond_to do |format|
      format.json { render json: todo, status: :ok }
    end
  end

  def destroy
    todo = Todo.find params[:id]

    todo.destroy()
    
    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end

  private 

  def todos_params
    params.require(:todo).permit(:id, :name, :category_id, :completed)
  end
end

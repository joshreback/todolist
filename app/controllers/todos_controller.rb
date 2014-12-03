class TodosController < ApplicationController

  def create
    params = todos_params

    todo = Todo.new todos_params

    if todo.save
      respond_to do |format|
        format.json { render json: todo, status: :ok }
      end
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
    params.require(:todo).permit(:name, :status, :category_id)
  end
end

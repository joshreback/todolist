class TodosController < ApplicationController

  def create
    params = todos_params

    @todo = Todo.new todos_params

    if @todo.save
      respond_to do |format|
        format.json { render json: nil, status: :ok }
      end
    end
  end

  def destroy
    binding.pry
    params = todos_params

    category_todos = Category.find params[:category_id]
    todo = category_todos.find_by_name params[:name]

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

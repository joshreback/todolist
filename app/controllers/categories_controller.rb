class CategoriesController < ApplicationController
  def index
    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: nil, status: :ok }
    end
  end

  def create
  end

  def show
  end

  def update
  end

  def delete
  end
end

class CategoriesController < ApplicationController
  def index
    ### Extremely temporary ###
    u = User.find 1

    respond_to do |format|
      format.html { render action: 'index' }
      format.json { render json: u.categories, status: :ok }
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

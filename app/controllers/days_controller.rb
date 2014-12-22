class DaysController < ApplicationController

  def index
    @date = Date.today
  end
end
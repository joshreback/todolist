module CategoriesHelper
  def display_date timestamp
    Date.parse(Time.at(timestamp.to_i/1000).to_s).strftime("%B %d, %Y")
  end
end

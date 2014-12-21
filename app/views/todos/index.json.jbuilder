@snapshot_of_day.each do |category, todos|
  json.category category
  json.todos todos, :name, :completed
end
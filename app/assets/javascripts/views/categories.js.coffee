Todolist.Views.Categories = Backbone.View.extend
  
  events: "click .new-category": "createNewCategory"

  createNewCategory: ->
    category_name = @$el.find(".category-name")
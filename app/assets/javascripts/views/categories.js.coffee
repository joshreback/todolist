Todolist.Views.Categories = Backbone.View.extend
  
  events: "click .new-category": "createNewCategory"

  createNewCategory: ->
    # Create new model
    new_category_model = new Todolist.Models.Category
      name: @$el.find(".category-name").val()

    # save model to server
    new_category_model.save
    
Todolist.Views.Category = Backbone.View.extend
  
  className: 'category-container'

  events:
    "click .delete-category": "deleteCategory"

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))

    todoCollection = new Todolist.Collections.Todos()
    todoCollection.category_id = @model.id
    todoCollectionView = new Todolist.Views.Todos
      collection: todoCollection

    @$el.append(todoCollectionView.el)
    @

  deleteCategory: (e)->
    # Remove el from the DOM
    @$el.remove()

    # Delete the Category server-side
    @model.destroy()
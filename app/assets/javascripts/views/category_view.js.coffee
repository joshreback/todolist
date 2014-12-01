Todolist.Views.Category = Backbone.View.extend
  
  className: 'category-container'

  events:
    "click .delete-category": "deleteCategory"

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))

    todoCollectionView = new Todolist.Views.Todos
      collection: new Todolist.Collections.Todos()

    @$el.append(todoCollectionView.el)
    @

  deleteCategory: (e)->
    # Remove el from the DOM
    @$el.remove()

    # Delete the Category server-side
    @model.destroy()
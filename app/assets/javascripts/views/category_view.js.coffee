Todolist.Views.Category = Backbone.View.extend
  
  events:
    "click .delete-category": "deleteCategory"

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))

    todoCollection = new Todolist.Collections.Todos()
    todoCollection.url = '/categories/' + @model.id + '/todos'
    todoCollection.category_id = @model.id
    todoCollectionView = new Todolist.Views.Todos
      collection: todoCollection

    @$el.find('.todo-list-container').append(todoCollectionView.el)
    @

  deleteCategory: (e)->
    # Remove el from the DOM
    @$el.remove()

    # Delete the Category server-side
    @model.destroy()
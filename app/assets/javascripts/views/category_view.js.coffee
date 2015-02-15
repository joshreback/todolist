Todolist.Views.Category = Backbone.View.extend
  
  className: "col-md-4"
    
  events:
    "click .delete-category": "markAsInactive"

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))

    todoCollection = new Todolist.Collections.Todos()
    todoCollection.url = '/categories/' + @model.id + '/todos'
    todoCollection.category_id = @model.id
    todoCollectionView = new Todolist.Views.Todos
      collection: todoCollection

    @$el.find('.todo-list-container').append(todoCollectionView.el)
    @

  markAsInactive: (e)->
    # Remove el from the DOM
    @$el.remove()

    # Delete the Category server-side
    @model.save
      active: false 
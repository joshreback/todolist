Todolist.Views.Category = Backbone.View.extend
  
  className: 'category'

  events:
    "click .new-todo":   "addTodo"

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))
    @

  addTodo: (e)->
    todo = new Todolist.Views.Todo()
    @listenTo(todo, 'saveTodo', @saveTodo)
    @$el.find('.todo-list').append(todo.el)

  saveTodo: (todoName, originalName=null)->
    # Save todo to model [which is kind of playing the role of a collection]
    @model.saveTodo(todoName, originalName) 
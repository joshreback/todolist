Todolist.Views.Category = Backbone.View.extend
  
  className: 'category'

  events:
    "click .new-todo":   "addTodo"

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))
    @

  addTodo: (e)->
    # Instantiate Todo
    todo = new Todolist.Views.Todo()

    # listenTo events bubbling up from associated Todos
    @listenTo(todo, 'saveTodo', @saveTodo)
    @listenTo(todo, 'destroyTodo', @destroyTodo)
    @listenTo(todo, 'completeTodo', @completeTodo)

    # Add this Todo to the DOM
    @$el.find('.todo-list').append(todo.el)

  saveTodo: (todoName, originalName=null)->
    # Save todo to model [which is kind of playing the role of a collection]
    @model.saveTodo(todoName, originalName) 

  destroyTodo: (todoName)->
    @model.destroyTodo(todoName)

  completeTodo: (todoName)->
    @model.completeTodo(todoName)
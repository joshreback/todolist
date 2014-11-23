Todolist.Views.Category = Backbone.View.extend
  
  className: 'category'

  events:
    "click .new-todo": "addTodo"

  initialize: ->
    @listenTo(Todolist.Views.Todo.prototype, 'saveTodo', @saveTodo)
    @listenTo(Todolist.Views.Todo.prototype, 'editTodo', @editTodo)

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))
    @

  addTodo: (e)->
    @$el.find('.todo-list').append(new Todolist.Views.Todo().el)

  saveTodo: (todoName)->
    # Save todo to model [which is kind of playing the role of a collection]
    @model.saveTodo(todoName)
    



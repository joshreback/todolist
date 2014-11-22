Todolist.Views.Category = Backbone.View.extend
  className: 'category'

  events:
    "click .new-todo": "addTodo"
    "click .save-todo": "saveTodo" 

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))
    @

  addTodo: (e)->
    @$el.find('.todo-list').append(HandlebarsTemplates['category/todo']())

  saveTodo: (e)->
    @model.saveTodo(@$el.find('.todo').val())
Todolist.Views.Todo = Backbone.View.extend

  className: "todo-container"

  events: 
    "click .save-todo":  "saveTodo"
    "click .edit-todo":  "editTodo"

  initialize: ->
    @originalName = null
    @render()

  render: ->
    @$el.html(HandlebarsTemplates['category/todo']())
    @


  saveTodo: (e)->
    # Disable the input text field
    @$el.find('.todo')[0].disabled = true

    @$el.find('.save-todo').addClass('hidden')
    @$el.find('.edit-todo').removeClass('hidden')
    @$el.find('.destroy-todo').removeClass('hidden')

    # Capture name of todo, trigger saveTodo event which bubbles up
    # and is handled by the Category model
    todoName = @$el.find('.todo').val()
    @trigger('saveTodo', todoName, @originalName)


  editTodo: (e)->
    # Capture old value of todo
    @originalName = @$el.find('.todo').val()

    # Reenable input field
    @$el.find('.todo')[0].disabled = false

    @$el.find('.save-todo').removeClass('hidden')
    @$el.find('.edit-todo').addClass('hidden')
    @$el.find('.destroy-todo').addClass('hidden')

Todolist.Views.Todo = Backbone.View.extend

  className: "todo-container"

  events: 
    "click .save-todo":     "saveTodo"
    "click .edit-todo":     "editTodo"
    "click .destroy-todo":  "destroyTodo"
    "click .complete-todo": "completeTodo"

  initialize: ->
    @originalName = null
    @render()

  render: ->
    @$el.html(HandlebarsTemplates['category/todo']())
    @


  saveTodo: (e)->
    # Disable the input text field
    @$el.find('.todo')[0].disabled = true

    @changeButtons()

    # Capture name of todo, trigger saveTodo event which bubbles up
    # and is handled by the Category model
    todoName = @$el.find('.todo').val()
    @trigger('saveTodo', todoName, @originalName)


  editTodo: (e)->
    # Capture old value of todo
    @originalName = @$el.find('.todo').val()

    # Reenable input field
    @$el.find('.todo')[0].disabled = false

    @changeButtons()


  destroyTodo: (e)->
    # Capture value of todo
    todoName = @$el.find('.todo').val()

    # Remove from the DOM
    @$el.remove()

    # trigger the destroyTodo event
    @trigger('destroyTodo', todoName)


  completeTodo: (e) ->
    # Capture value of completed Todo
    todoName = @$el.find('.todo').val()

    # Apply "completed" style
    @$el.find('.todo').addClass('completed')

    # Hide all buttons (no more editing)
    @$el.find('.save-todo').addClass('hidden')
    @$el.find('.edit-todo').addClass('hidden')
    @$el.find('.destroy-todo').addClass('hidden')
    @$el.find('.complete-todo').addClass('hidden')

    # Trigger the completeTodo event
    @trigger('completeTodo', todoName)


  changeButtons: ->
    @$el.find('.save-todo').toggleClass('hidden')
    @$el.find('.edit-todo').toggleClass('hidden')
    @$el.find('.destroy-todo').toggleClass('hidden')
    @$el.find('.complete-todo').toggleClass('hidden')



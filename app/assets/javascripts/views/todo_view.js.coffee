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
    debugger;
    # Disable the input text field
    @$el.find('.todo')[0].disabled = true

    @changeButtons()

    # Capture name of todo, trigger saveTodo event which bubbles up
    # and is handled by the Todos collection
    todoName = @$el.find('.todo').val()
    @model.set
      name:   todoName
      status: "incomplete"

    @trigger('saveTodo', @model)


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
    @trigger('destroyTodo', @model)


  completeTodo: (e) ->
    # Apply "completed" style
    @$el.find('.todo').addClass('completed')

    # Hide all buttons (no more editing)
    @$el.find('.edit-todo').addClass('hidden')
    @$el.find('.destroy-todo').addClass('hidden')
    @$el.find('.complete-todo').addClass('hidden')

    # Update status of this model
    @model.set
      status: "complete"


  changeButtons: ->
    @$el.find('.save-todo').toggleClass('hidden')
    @$el.find('.edit-todo').toggleClass('hidden')
    @$el.find('.destroy-todo').toggleClass('hidden')
    @$el.find('.complete-todo').toggleClass('hidden')



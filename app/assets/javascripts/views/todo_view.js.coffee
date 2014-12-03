Todolist.Views.Todo = Backbone.View.extend

  className: "todo-container"

  events: 
    "click .save-todo":     "saveTodo"
    "click .edit-todo":     "editTodo"
    "click .destroy-todo":  "destroyTodo"
    "click .complete-todo": "completeTodo"

  initialize: ->
    @render()

  render: ->
    @$el.html(HandlebarsTemplates['category/todo']())
    @

  saveTodo: (e)->
    # Disable the input text field and change buttons
    @$el.find('.todo')[0].disabled = true
    @changeButtons()

    # Capture name of todo, trigger saveTodo event which bubbles up and is
    # handled by the Todos collection, and save todo model to server
    todoName = @$el.find('.todo').val()
    @model.set
      name:   todoName
      status: "incomplete"

    @model.save()
    @trigger('saveTodo', @model)

  editTodo: (e)->
    # Reenable input field
    @$el.find('.todo')[0].disabled = false

    @changeButtons()

  destroyTodo: (e)->
    # Remove from the DOM
    @$el.remove()
    # TODOJ: there must be a better pattern for deleting backbone models 
    #        such that you don't need to manually append the id to the URL
    @model.url += '/' + @model.id
    @model.destroy()
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



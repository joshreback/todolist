Todolist.Views.Todo = Backbone.View.extend

  className: "todo-container"

  events: 
    "click .save-todo":     "saveTodo"
    "click .edit-todo":     "editTodo"
    "click .destroy-todo":  "destroyTodo"
    "click .complete-todo": "completeTodo"

  initialize: ->
    _.bindAll @, 'render'
    @model.on('change', @render)
    @render()

  render: ->
    if @model.get('completed') == true
      @$el.html(HandlebarsTemplates['category/completed_todo']({
          name: @model.get('name')
        })
      )
    else if @model.get('name') && !@model.get('editMode')
      @$el.html(HandlebarsTemplates['category/todo']({
          name: @model.get('name')
        })
      )
    else
      @$el.html(HandlebarsTemplates['category/new_todo']({
          name: @model.get('name')
        })
      )
    @

  saveTodo: (e)->
    # Disable the input text field and change buttons
    @$el.find('.todo')[0].disabled = true

    # Capture name of todo, trigger saveTodo event which bubbles up and is
    # handled by the Todos collection, and save todo model to server
    todoName = @$el.find('.todo').val()

    @model.updateUrl() if @model.get('editMode')
    @model.set
      name:   todoName
      status: "incomplete"
      editMode: false
    @model.save()
    @trigger('saveTodo', @model)

  editTodo: (e)->
    # Reenable input field
    @$el.find('.todo')[0].disabled = false
    @model.set
      editMode: true
    @model.updateUrl()

  destroyTodo: (e)->
    # Remove from the DOM
    @$el.remove()
    # TODOJ: there must be a better pattern for deleting backbone models 
    #        such that you don't need to manually append the id to the URL
    @model.updateUrl()
    @model.destroy()
    @trigger('destroyTodo', @model)

  completeTodo: (e) ->
    # Update status of this model
    @model.set
      completed: 1
    @model.updateUrl()
    debugger;
    @model.save()





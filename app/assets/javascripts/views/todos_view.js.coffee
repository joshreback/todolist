Todolist.Views.Todos = Backbone.View.extend

  className: 'category-todo-list'

  events:
    "click .new-todo":   "addTodo"

  initialize: ->
    @render()

  render: ->
    # PRACTICE, collection-view
    @$el.html(HandleBarsTemplates['category/todos'])()
    @collection.forEach (todo)=>
      @addOne(category)

  addOne: (model) ->
    todoView = new Todolist.Views.Todo
      model: model
    @$el.append(todoView.el)

############################
###### Event Handlers ######
############################

  addTodo: (e)->
    # Instantiate Todo
    todo = new Todolist.Views.Todo
      model: Todolist.Models.Todo

    # listenTo events bubbling up from associated Todos
    @listenTo(todo, 'saveTodo', @saveTodo)
    @listenTo(todo, 'destroyTodo', @destroyTodo)
    @listenTo(todo, 'completeTodo', @completeTodo)

    # Add this Todo to the DOM
    @$el.append(todo.el)

  saveTodo: (todoName, originalName=null)->
    @model.saveTodo(todoName, originalName) 

  destroyTodo: (todoName)->
    @model.destroyTodo(todoName)

  completeTodo: (todoName)->
    @model.completeTodo(todoName)
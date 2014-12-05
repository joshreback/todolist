Todolist.Views.Todos = Backbone.View.extend

  className: 'category-todo-list'

  events:
    "click .new-todo":   "addTodo"

  initialize: ->
    _.bindAll @, "render"
    @collection.on('sync', @render)
    @collection.fetch()

  render: ->
    # PRACTICE, collection-view
    @$el.html(HandlebarsTemplates['category/todos']())
    @collection.forEach (todo)=>
      todo.setUrl(@collection.category_id)
      @addOne(todo)

  addOne: (model) ->
    todoView = new Todolist.Views.Todo
      model: model
    @$el.append(todoView.el)

############################
###### Event Handlers ######
############################

  addTodo: (e)->
    # Instantiate Todo
    todoModel = new Todolist.Models.Todo(@collection.category_id)
    todo = new Todolist.Views.Todo
      model: todoModel

    # listenTo events bubbling up from associated Todos
    @listenTo(todo, 'saveTodo', @saveTodo)
    @listenTo(todo, 'destroyTodo', @destroyTodo)
    @listenTo(todo, 'completeTodo', @completeTodo)

    # Add this Todo to the DOM
    @$el.append(todo.el)

  saveTodo: (todoModel)->
    @collection.saveTodo(todoModel) 

  destroyTodo: (todoModel)->
    @collection.destroyTodo(todoModel)

  completeTodo: (todoModel)->
    @collection.completeTodo(todoModel)
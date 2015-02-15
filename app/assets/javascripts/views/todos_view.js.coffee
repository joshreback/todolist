Todolist.Views.Todos = Backbone.View.extend

  className:
    "todos-container"

  events:
    "click .new-todo":          "addTodo"
    "click .yesterdays-todos":  "fetchYesterdays"

  initialize: ->
    _.bindAll @, "render"
    @collection.on('sync', @render)
    @collection.fetch
      data:
        $.param(day_timestamp: Date.now())

  render: ->
    # PRACTICE, collection-view
    @$el.html(HandlebarsTemplates['category/todos']({notUsingYesterdays: @collection.fetchedYesterdays}))
    @collection.forEach (todo)=>
      todo.setUrl(@collection.category_id)
      @addOne(todo)

  addOne: (model) ->
    todoView = new Todolist.Views.Todo
      model: model
    @$el.find('.todo-list').append(todoView.el)

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
    @$el.find('.todo-list').append(todo.el)

  fetchYesterdays: (e)->
    e.preventDefault()

    @collection.fetchedYesterdays = true

    yesterdayTimeStamp = new Date() - 1000 * 60 * 60 * 24

    @collection.fetch
      remove: false
      data: 
        $.param
          create_new_todos: true
          day_timestamp: yesterdayTimeStamp
    

  saveTodo: (todoModel)->
    @collection.saveTodo(todoModel) 

  destroyTodo: (todoModel)->
    @collection.destroyTodo(todoModel)

  completeTodo: (todoModel)->
    @collection.completeTodo(todoModel)
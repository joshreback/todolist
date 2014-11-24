Todolist.Models.Category = Backbone.Model.extend
  urlRoot: '/categories'

  # Either create, update, or add a todo to the todolist maintained by the category
  saveTodo: (newTodo, originalName)->
    if !@get('todos')
      # First Todo in the category
      todos = {}
      todos[newTodo] = "incomplete"
      @set({ todos: todos })
    else if originalName
      # Editing a Todo
      todos = @get('todos')
      delete todos[originalName]
      todos[newTodo] = "incomplete"  # Can't rename a completed Todo
      @set({ todos: todos })
    else 
      # Adding a new Todo
      todos = @get('todos')
      todos[newTodo] = "incomplete"
      @set({ todos: todos })


  # Deletes a Todo from this category
  destroyTodo: (todoName) ->
    todos = @get('todos')
    delete todos[todoName]
    @set({ todos: todos }) 


  # Mark the Todo as completed
  completeTodo: (todoName)->
    todos = @get('todos')
    todos[todoName] = "complete"
    @set({ todos: todos })

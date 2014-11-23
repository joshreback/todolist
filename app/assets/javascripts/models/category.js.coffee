Todolist.Models.Category = Backbone.Model.extend
  urlRoot: '/categories'

  # Either create, update, or add a todo to the todolist maintained by the category
  saveTodo: (newTodo, originalName)->
    if !@get('todos')
      @set({ todos: [newTodo] })
    else if originalName
      todos = @get('todos')
      todos[todos.indexOf(originalName)] = newTodo
      @set({ todos: todos })
    else 
      @get('todos').push(newTodo)



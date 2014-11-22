Todolist.Models.Category = Backbone.Model.extend
  urlRoot: '/categories'

  saveTodo: (todo)->
    if !@get('todos')
      @set({ todos: [todo] })
    else 
      @get('todos').push(todo)


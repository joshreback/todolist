Todolist.Collections.Todos = Backbone.Collection.extend
  model: Todolist.Models.Todo

  saveTodo: (todo)->
    @add todo

  destroyTodo: (todo)->
    @remove todo

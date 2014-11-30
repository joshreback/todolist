Todolist.Collections.Todos = Backbone.Collection.extend
  model: Todolist.Models.Todo

  initialize: (category_id)->
    # Set as a property on the collection
    @category_id = category_id

  saveTodo: (todo)->
    @add todo

  destroyTodo: (todo)->
    @remove todo

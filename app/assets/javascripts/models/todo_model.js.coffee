Todolist.Models.Todo = Backbone.Model.extend
  
  initialize: ->
    @url = '/categories/' + @collection.category_id + '/todos'
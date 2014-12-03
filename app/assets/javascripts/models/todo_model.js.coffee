Todolist.Models.Todo = Backbone.Model.extend
  
  initialize: (category_id)->
    @set
      category_id: category_id

    @url = '/categories/' + category_id + '/todos'
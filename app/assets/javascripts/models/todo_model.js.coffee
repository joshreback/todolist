Todolist.Models.Todo = Backbone.Model.extend
  
  initialize: (category_id)->
    cid = category_id
    @url = '/categories/' + cid + '/todos'
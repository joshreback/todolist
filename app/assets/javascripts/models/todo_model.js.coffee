Todolist.Models.Todo = Backbone.Model.extend
  
  initialize: (category_id=null)->
    cid = category_id || @collection.category_id
    @url = '/categories/' + cid + '/todos'
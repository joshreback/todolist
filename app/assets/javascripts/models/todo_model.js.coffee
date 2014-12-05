Todolist.Models.Todo = Backbone.Model.extend
  
  defaults:
    completed: 0
  initialize: (category_id)->
    @set
      category_id: category_id

    @url = '/categories/' + @get('category_id') + '/todos'

  updateUrl: ()->
    @url = '/categories/' + @get('category_id') + '/todos/' + @id
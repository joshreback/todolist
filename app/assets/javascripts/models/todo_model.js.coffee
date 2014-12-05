Todolist.Models.Todo = Backbone.Model.extend
  
  defaults:
    completed: 0

  initialize: (category_id)->
    @setUrl(category_id)

  # Kind of messy, but there is a setUrl method for models that are preloaded
  # from the server and aren't initialized on the page by clicking the 'Add Todo'
  # button. So, before the model's corresponding view is rendered, we need to set
  # the URL of so it can be persisted back to the server in case there are any edits.
  setUrl: (category_id)->
    @set
      category_id: category_id
    @url = '/categories/' + category_id + '/todos'

  # The udpateUrl function is called after a model is already saved and further operations,
  # such as udpate and destroy (which require working with a specific model and thus need a
  # url which includes the model id).
  updateUrl: ->
    @url = '/categories/' + @get('category_id') + '/todos/' + @id
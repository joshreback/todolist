Todolist.Views.Todos = Backbone.View.extend
  
  initialize: ->
    @render()

  render: ->
    # PRACTICE, collection-view
    @collection.forEach (todo)=>
      @addOne(category)

  addOne: (model) ->
    todoView = new Todolist.Views.Todo
      model: model
    @$el.append(todoView.el)
Todolist.Views.Categories = Backbone.View.extend
  
  events: "click .new-category": "createNewCategory"

  initialize: ->
    _.bindAll @, 'render'
    @collection.on('sync', @render)
    @collection.fetch()

  render: ->
    console.log 'rendering'

  createNewCategory: ->
    category_name = @$el.find(".category-name")
    
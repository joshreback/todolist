Todolist.Views.Categories = Backbone.View.extend
  
  events: "click .new-category": "createNewCategory"

  initialize: ->
    _.bindAll @, 'render'
    @collection.on('sync', @render)
    @collection.fetch()

  render: ->
    # PRACTICE, collection-view
    @collection.forEach (category)=>
      categoryView = new Todolist.Views.Category
        model: category
      @$el.append(categoryView.render().el)

  createNewCategory: ->
    category_name = @$el.find(".category-name")
    
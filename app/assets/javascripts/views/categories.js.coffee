Todolist.Views.Categories = Backbone.View.extend
  
  events: "click .new-category": "createNewCategory"

  initialize: ->
    _.bindAll @, 'render', 'addOne'

    @collection.on('add', @addOne)
    @collection.on('sync', @render)
    @collection.fetch()  # Make a json fetch

  render: ->
    @$el.find("#categories-list").html("")

    # PRACTICE, collection-view
    @collection.forEach (category)=>
      @addOne(category)

  addOne: (model) ->
    categoryView = new Todolist.Views.Category
      model: model
    @$el.find("#categories-list").append(categoryView.render().el)

  createNewCategory: ->
    # Create new model
    new_category_model = new Todolist.Models.Category
      name: @$el.find(".category-name").val()

    # Add to collection
    @collection.add(new_category_model)

    # save model to server
    new_category_model.save()
    
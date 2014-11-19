Todolist.Views.Categories = Backbone.View.extend
  
  events: "click .new-category": "createNewCategory"

  initialize: ->
    _.bindAll @, 'render'
    @collection.on('sync', @render)

  render: ->
    # PRACTICE, collection-view
    @collection.forEach (category)=>
      categoryView = new Todolist.Views.Category
        model: category
      @$el.append(categoryView.render().el)

  createNewCategory: ->
    # Create new model
    new_category_model = new Todolist.Models.Category
      name: @$el.find(".category-name").val()

    # Add to collection
    @collection.add(new_category_model)

    # save model to server
    new_category_model.save()
    
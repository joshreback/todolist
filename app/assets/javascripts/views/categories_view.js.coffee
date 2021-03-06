Todolist.Views.Categories = Backbone.View.extend
  
  events: 
    "click .new-category": "createNewCategory"

  initialize: ->
    _.bindAll @, 'render', 'addOne'
    @collection.on('add', @addOne)
    @render()

  render: ->
    # PRACTICE, collection-view
    @collection.forEach (category)=>
      @addOne(category)

  addOne: (model) ->
    categoryView = new Todolist.Views.Category
      model: model
    @$el.find("#categories-list").append(categoryView.render().el)

  createNewCategory: (e) ->
    debugger;
    e.stopPropagation()

    # Create new model
    new_category_model = new Todolist.Models.Category
      name: @$el.find(".category-name").val()

    new_category_model.save().then ()=>
      @collection.add(new_category_model)

    
    
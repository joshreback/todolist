Todolist.Views.Category = Backbone.View.extend
  
  className: 'category-container'

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))
    
    todoCollectionView = new Todolist.Views.Todos
      collection: Todolist.Collections.Todos

    @$el.append(todoCollectionView.el)
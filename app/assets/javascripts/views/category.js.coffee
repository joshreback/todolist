Todolist.Views.Category = Backbone.View.extend

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))
    @

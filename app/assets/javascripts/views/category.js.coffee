Todolist.Views.Category = Backbone.View.extend

  events:
    "click .new-todo": "addTodo"

  render: ->
    @$el.html(HandlebarsTemplates['category/category'](@model.toJSON()))
    @

  addTodo: (e)->
    @$el.append("<input type='text' class='todo' placeholder='Enter your todo here'/>")

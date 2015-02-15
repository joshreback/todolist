Todolist.Models.Calendar = Backbone.Model.extend
  
  initialize: (opts={}) ->
    @month = opts["month"] if opts["month"]
    @year = opts["year"] if opts["year"]

  getMonth: ->
    return @month

  getYear: ->
    return @year
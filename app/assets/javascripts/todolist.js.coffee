#= require_self
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.Todolist =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->

$(document).ready ->
  Todolist.initialize()

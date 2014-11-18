# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $("body#categories.index")
    categoriesCollection = new Todolist.Collections.Categories()
    categoriesView = new Todolist.Views.Categories
      el: $(".container")
      collection: categoriesCollection
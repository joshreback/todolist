# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $("body#categories.index").length
    userCategories = $("#categories-list").data("collection")
    categoriesCollection = new Todolist.Collections.Categories(userCategories)
    categoriesView = new Todolist.Views.Categories
      el:         $(".container")
      collection: categoriesCollection

  else if $("body#categories.calendar").length
    opts = {
      month: $("#month").data("month") - 1,
      year: $("#month").data("year") 
    }
    
    calendarModel = new Todolist.Models.Calendar(opts)
    calendarView = new Todolist.Views.Calendar
      el: $("#calendar")
      model: calendarModel



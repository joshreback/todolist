Todolist.Views.Calendar = Backbone.View.extend
  events:
    "click td": "clickedDayCell"

  clickedDayCell: (e)->
    day = parseInt(e.currentTarget.innerText)
    month = @model.getMonth()
    year = @model.getYear()
    $.ajax(
      url: '/categories'
      dataType: 'json'
      success: (response)->
        debugger;
      complete: (response)->
        debugger;
    )

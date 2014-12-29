Todolist.Views.Calendar = Backbone.View.extend
  events:
    "click td": "clickedDayCell"

  clickedDayCell: (e)->
    day = parseInt(e.currentTarget.innerText)
    month = @model.getMonth()
    year = @model.getYear()
    date_timestamp = new Date(year, month, day).getTime()
    $.ajax(
      url: '/categories'
      dataType: 'json'
      data:
        day_timestamp: date_timestamp
      success: (response)->
        debugger;
    )

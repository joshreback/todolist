module DayHelper
  def calendar(date=Date.today, &block)
    # Instantiate the Calendar Struct, defined below
    # And call its table method
    Calendar.new(self, date, block).table
  end

  # Calendar Struct
  # Takes a view, a date, and a callback function
  class Calendar < Struct.new(:view, :date, :callback)
    # Class variables
    HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    START_DAY = :sunday

    delegate :content_tag, to: :view

    # Top-level function to make a table tag with class "calendar"
    # Puts the header (i.e, the days) in the top row and then the
    # rows for the week after work
    def table
      content_tag :table, class: "calendar" do
        (header + week_rows)
      end
    end

    # Maps each string literal for a day of the week to an html tag, as follows:
    # "Sunday", "Monday", "Tuesday", ... ==> 
    # <tr>
    #   <th>"Sunday"</th><th>"Monday"</th><th>"Tuesday"</th>
    # </tr>
    def header
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day }.join.html_safe
      end
    end

    # Returns a list of tr tags for each week in the month
    # Within each tr tag, render a bunch of <td>day</td> cells
    def week_rows
      weeks.map do |week|
        content_tag :tr do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end
    end

    # Turns a day, i.e, a number representing that day in the month, into a table
    # cell with appropriate styling. So 4 => <td class="month/not-month">4</td>
    #
    # Captures the block (callback) with the day included as a variable, gives it an 
    # appropriate class, and puts it inside a td tag
    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    # Possible classes are "today" and/or "notmonth"
    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month # The date parameter
      classes.empty? ? nil : classes.join(" ")
    end

    # Get first day of the month to show on the calendar
    # Get last day of the month to show on the calendar
    # Return them as an array of arrays, each sub-array has 7 elements
    # This, wrapped in tr and td tags, is the content of the second 
    # part of the table method
    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)  # Sunday right before beginning of month
      last = date.end_of_month.end_of_week(START_DAY)  # Saturday right after end of month
      (first..last).to_a.in_groups_of(7)
    end
  end
end

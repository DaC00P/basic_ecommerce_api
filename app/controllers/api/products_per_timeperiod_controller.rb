class Api::ProductsPerTimeperiodController < ApplicationController
  def index
    #run an activerecord query that takes a date range
    #and gets all the products sold by quantity per day/week/month
    #use includes here for eager loading to avoid many DB queries
    date_range = format_date(params[:dates])
    time_breakdown_coefficient = format_time_breakdown(params[:time_period], date_range)



    ##TODO finish this, avoid N+1 queries in the process. Figure out if doing them in sequence counts as an N+1
  end

  private
  #do standard date formatting and strip the time.
  #assuming the date range is coming into the API as an array with two date strings in it
  def format_date(dates)
    dates.map! {|date| Date.parse(date) }
  end

  #format the type of time period breakdown we need. To obtain # of products sold per day
  #so: date_range | product | SUM products divided by COUNT days/weeks/months
  #it is assumed that the date range is in order of: [first_date_chronologically, second_date_chronologically]
  def format_time_breakdown(time_period, date_range)
    difference_in_dates = date_range[1] - date_range[0]

    case time_period
      when time_period == 'day'
        return difference_in_dates
      when time_period == 'month'
        return difference_in_dates / 30
      when time_period == 'year'
        return difference_in_dates / 365
    end
  end

end


# current_bookings = Reservation.where(restaurant_id: self.restaurant_id)
#                        .where(time: self.time)
#                        .where(date: self.date)
#                        .sum(:party_size) + self.party_size

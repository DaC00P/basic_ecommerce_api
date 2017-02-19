class Api::ProductsPerTimeperiodController < ApplicationController
  def index
    #run an activerecord query that takes a date range
    #and gets all the products sold by quantity per day/week/month
    #use includes here for eager loading to avoid many DB queries
    @date_range = format_date(params[:dates])
    @products = Order.products_per_timeperiod(params[:time_option])
    render json: @products
  end

  private
  #do standard date formatting and strip the time.
  #assuming the date range is coming into the API as an array with two date strings in it
  def format_date(dates)
    dates.map! {|date| Date.parse(date) }
  end

end

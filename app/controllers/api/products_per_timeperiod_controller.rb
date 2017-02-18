class Api::ProductsPerTimeperiodController < ApplicationController
  def index
    #run an activerecord query that takes a date range
    #and gets all the products sold by quantity per day/week/month
    Product.where()
  end

  private

  def format_date(date)
    DateTime.strptime(date, '%m-%d-%Y').to_date
  end
end


# current_bookings = Reservation.where(restaurant_id: self.restaurant_id)
#                        .where(time: self.time)
#                        .where(date: self.date)
#                        .sum(:party_size) + self.party_size

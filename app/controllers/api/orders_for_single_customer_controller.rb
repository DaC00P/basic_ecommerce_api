class Api::OrdersForSingleCustomerController < ApplicationController
  def index
    #run an activerecord query that gets all the orders for a single customer.
    #This is being run using the standard has_many AR relation once the customer ID is obtained from the params.
    @customer = Customer.find(params[:id])
    render json: @customer.orders
  end
end

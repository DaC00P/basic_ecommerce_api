class Api::CategoriesPurchasedForSingleCustomerController < ApplicationController
  #want to use a query to generate this table
  #customer_id | customer_first_name | category_id | category_name | number_purchased
  #this is categories purchased per customer
  def index
    @customer_id = params[:customer_id].to_i
    render json: Customer.categories_purchased_per_customer
  end
end

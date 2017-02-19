class Api::CategoriesPurchasedForSingleCustomerController < ApplicationController
  #want to use a query to generate this table
  #customer_id | customer_first_name | category_id | category_name | number_purchased
  #this is categories purchased per customer
  @customer_id = params[:customer_id]
  @connection = ActiveRecord::Base.connection
  @query = File.read('../static/categories_purchased_per_customer_query.txt')
  @connection.exec_query(@query)
end

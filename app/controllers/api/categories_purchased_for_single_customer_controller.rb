class Api::CategoriesPurchasedForSingleCustomerController < ApplicationController
  #want to use a query to generate this table
  #customer_id | customer_first_name | category_id | category_name | number_purchased
  #this is categories purchased per customer
  #once the query is written as a scope, extract it to be SQL in a separate file
end

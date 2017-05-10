class Api::CategoriesPurchasedForSingleUserController < ApplicationController
  #want to use a query to generate this table
  #customer_id | customer_first_name | category_id | category_name | number_purchased
  #this is categories purchased per customer
  def index
    @user_id = params[:user_id].to_i
    render json: User.categories_purchased_per_user
  end
end

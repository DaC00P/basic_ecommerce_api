class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order
    else
      ##TODO make error message to user clearer
      render json: @order.errors, status: 422
    end
  end

  def index
    @order = Order.all
    render json: @order
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attributes(order_params)
    if @order.save
      render json: @order
    else
      ##TODO make error message clearer
      render json: @order.errors, status: 422
    end
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    if @order == nil
      render(
        json: {error: "This order cannot be deleted because the system cannot find it by ID"},
        status: 422
      )
    end
    if @order.destroy
      render json: @order
    else
      render json: @order.errors, status: 422
    end
  end

  private
  #it is assumed order items will be nested in the POST request
  def order_params
		params.require(:order).permit(:order_items, :customer_id)
  end
end

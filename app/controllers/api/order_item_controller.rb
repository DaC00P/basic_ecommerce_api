class OrderItemController < ApplicationController
  def create
    @order_item = Order_Item.new(order_item_params)
    if @order_item.save
      render json: @order_item
    else
      ##TODO make error message to user clearer
      render json: @order_item.errors, status: 422
    end
  end

  def index
    @order_item = Order_Item.all
    render json: @order_item
  end

  def update
    @order_item = Order_Item.find(params[:id])
    @order_item.update_attributes(order_item_params)
    if @order_item.save
      render json: @order_item
    else
      ##TODO make error message clearer
      render json: @order_item.errors, status: 422
    end
  end

  def destroy
    @order_item = Order_Item.find_by(id: params[:id])
    if @order_item == nil
      render(
        json: {error: "This order cannot be deleted because the system cannot find it by ID"},
        status: 422
      )
    end
    if @order_item.destroy
      render json: @order_item
    else
      render json: @order_item.errors, status: 422
    end
  end

  private
  def order_item_params
		params.require(:order_item).permit(:order_id, :product_id, :product_quantity)
  end
end

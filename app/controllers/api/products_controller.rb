class Api::ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: 201
    else
      render json: @product.errors, status: 422
    end
  end

  def index
    @product = Product.all
    render json: @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(reservation_params)
    if @product.save
      render json: @product
    else
      render json: @product.errors, status: 422
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])

    #render an error if the product cannot be found, and thus will throw an error if a destroy is attempted
    if @product == nil
      render(
        json: {error: "This customer cannot be deleted because the system cannot find it by ID"},
        status: 422
      )
    end

    if @product.destroy
      render json: @product
    else
      render json: @product.errors, status: 422
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :out_of_stock, :category_id)
  end
end

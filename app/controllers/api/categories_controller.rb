class Api::CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: 201
    else
      render json: @category.errors, status: 422
    end
  end

  def index
    @category = Category.all
    render json: @category
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(reservation_params)
    if @category.save
      render json: @category
    else
      render json: @category.errors, status: 422
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])

    #render an error if the category cannot be found, and thus will throw an error if a destroy is attempted
    if @category == nil
      render(
        json: {error: "This category cannot be deleted because the system cannot find it by ID"},
        status: 422
      )
    end

    if @category.destroy
      render json: @category
    else
      render json: @category.errors, status: 422
    end
  end

  private

  def category_params
    params.require(:category).permit(:description)
  end
end

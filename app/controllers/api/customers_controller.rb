class Api::CustomersController < ApplicationController
	def create
		@customer = User.new(customer_params)

		if @customer.save
			render json: @customer, status: 201
		else
			render json: @customer.errors, status: 422
		end
	end

  def index
    @customer = Customer.all
    render json: @customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(customer_params)
    if @customer.save
      render json: @customer
    else
      render json: @customer.errors, status: 422
    end
  end

  def destroy
    @customer = Customer.find_by(id: params[:id])

    #render an error if the customer cannot be found, and thus will throw an error if a destroy is attempted
    if @customer == nil
      render(
        json: {error: "This customer cannot be deleted because the system cannot find it by ID"},
        status: 422
      )
    end

    if @customer.destroy
      render json: @customer
    else
      render json: @customer.errors, status: 422
    end
  end

	private

	def customer_params
		params.require(:customer).permit(:customer_first_name, :customer_last_name, :customer_email_address, :username)
	end
end

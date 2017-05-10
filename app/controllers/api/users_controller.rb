class Api::UsersController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = User.new(user_params)

		if @user.save
			render json: @user, status: 201
		else
			render json: @user.errors, status: 422
		end
	end

  def index
    @user = User.all
    render json: @user
  end

	def show
		@user = User.find(params[:id])
		if @user
			render json: @user
		else
			render(
				json: {error: "This user cannot be found."},
				status: 422
			)
		end
	end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: 422
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    #render an error if the user cannot be found, and thus will throw an error if a destroy is attempted
    if @user == nil
      render(
        json: {error: "This user cannot be deleted because the system cannot find it by ID"},
        status: 422
      )
    end

    if @user.destroy
      render json: @user
    else
      render json: @user.errors, status: 422
    end
  end

	private

	def user_params
		params.require(:user).permit(:user_first_name, :user_last_name, :email, :username)
	end
end

class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def edit

	end

	def update
		user = current_user
		user.assign_attributes(user_params)
		if user.save
			redirect_to root_path
		else
			render "edit"
		end
	end

	def comments
		@user = User.find(params[:id])
	end

	private

		def user_params
			params.require(:user).permit(:username, :password, :password_confirmation, :avatar)
		end

end

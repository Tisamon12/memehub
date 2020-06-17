class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@memes = @user.memes.paginate(page: params[:page], per_page: 10).order("created_at DESC")
	end

	def edit

	end

	def update
		@user = current_user
		@user.assign_attributes(user_params)
		@user.skip_password_validation = true
		if @user.save
			redirect_to root_path
		else
			render "edit"
		end
	end

	def update_password
		@user = current_user
		@user.assign_attributes(user_params)
		@user.skip_password_validation = false
		if @user.save
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

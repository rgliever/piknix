class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
    @posts = @user.posts.all.order("date(created_at)").reverse
	end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :password, :password_confirmation)
  	end
end

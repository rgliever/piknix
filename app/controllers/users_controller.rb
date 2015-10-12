class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

	def show
		@user = User.find_by_name(params[:id])
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
      flash[:error] = "Uh-oh, #{@user.errors.full_messages.to_sentence}"
  		render 'new'
  	end
  end

  def edit
    @user = User.find_by_name(params[:id])
  end

  def update
    @user = User.find_by_name(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:error] = "Uh-oh, #{@user.errors.full_messages.to_sentence}"
      render 'edit'
    end
  end

  def destroy
    User.find_by_name(params[:id]).destroy
    flash[:success] = "Account deleted"
    redirect_to root_url
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :password, :password_confirmation)
  	end

    # Before filters

    # confirms a logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # confirms the correct user
    def correct_user
      @user = User.find_by_name(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end

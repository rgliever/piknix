class PostsController < ApplicationController
  def index
  	@posts = Post.all.order("date(created_at)").reverse
  	@post = Post.new
  end

  def new
  	@post = Post.new
  end

  def show_errors(post)
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
      flash.now[:success] = "Your image was posted!"
  		redirect_to root_url
  	else
      flash[:error] = "There was a problem posting your image: 
                    #{@post.errors.full_messages.to_sentence}"
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js { render :js => 'show_post_form();'}
      end
  	end
  end

  private

  	def post_params
  		params.require(:post).permit(:url, :description)
  	end
end

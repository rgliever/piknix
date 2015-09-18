class PostsController < ApplicationController
  def index
  	@posts = Post.all.order("date(created_at)").reverse
  	@post = Post.new
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @post.user = current_user
  	if @post.save
      flash[:success] = "Your image was posted!"
  		redirect_to root_url
  	else
      flash[:error] = "There was a problem posting your image: 
                    #{@post.errors.full_messages.to_sentence}"
      redirect_to root_url
  	end
  end

  private

  	def post_params
  		params.require(:post).permit(:url, :image, :description)
  	end
end

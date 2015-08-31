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
  	if @post.save
  		redirect_to :action => :index
  	else
  		flash.now[:danger] = 'Uh-oh. There was a problem with your post.'
  	end
  end

  private

  	def post_params
  		params.require(:post).permit(:url, :description)
  	end
end

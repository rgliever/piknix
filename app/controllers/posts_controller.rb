class PostsController < ApplicationController
  def index
  	@posts = Post.all.order("date(created_at)").reverse
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @post.user = current_user
  	if @post.save
      flash[:success] = "Your image was posted!"
  	else
      flash[:error] = "There was a problem posting your image: 
                    #{@post.errors.full_messages.to_sentence}"
  	end
    redirect_to :back
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to :back
  end

  private

  	def post_params
  		params.require(:post).permit(:url, :image, :description)
  	end
end

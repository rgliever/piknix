class PostsController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    elsif params[:search]
      @posts = Post.search(params[:search])
    else
      @posts = Post.all.order("date(created_at)").reverse
    end
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Tags updated"
    else
      flash[:error] = "Uh-oh, #{@post.errors.full_messages.to_sentence}"
    end
    redirect_to :back
  end

  def destroy
    post = Post.find(params[:id])
    post.taggings.each do |tagging|
      Tagging.find(tagging.id).destroy
    end
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to :back
  end

  private

  	def post_params
  		params.require(:post).permit(:url, :image, :description, :content, :name, :tag_list)
  	end
end

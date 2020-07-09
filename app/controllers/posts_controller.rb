class PostsController < ApplicationController

  def new
    @post = current_user.posts.build
  end


  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:msg] = 'Your post was successful!'
      redirect_to posts_path
    else
      render :new
    end
  end


  def index
    @posts = Post.all.order(created_at: :desc)
        # default setting order for created_at column, newest item first

  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    # destroy is a buildin method for delete post. @post is assignning the id to a particular post to destroy
    flash[:msg] = 'Your post was deleted!'
    redirect_to posts_path
  end
 

  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:msg] = 'Your post was updated!'
    redirect_to posts_path

  end


  private

  def post_params
    params.require(:post).permit(:message)
  end
end
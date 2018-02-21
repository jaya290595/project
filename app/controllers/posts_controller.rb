class PostsController < ApplicationController
  def index
    @post=Post.new
    @posts=Post.all
  end

  def create
  	@post=Post.new(post_params)
  	if @post.save
      respond_to do |format|
        format.js
      end
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
      @post=Post.find(params[:id])
      if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def show
  	@post = Post.find(params[:id])
  end

  private

  def post_params
  	params.require(:post).permit(:title,:text)
  end

end
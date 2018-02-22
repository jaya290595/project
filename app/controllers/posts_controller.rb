class PostsController < ApplicationController
  def index
    @posts=Post.all.order("created_at DESC")
    @post= Post.new
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
    
    respond_to do |format|
      format.js
    end
  end

  def update
      @post=Post.find(params[:id])
      if @post.update(post_params)
          respond_to do |format|
          format.js
          end
      else
      render 'edit'
      end
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to root_path
    respond_to do |format|
      format.js
    end
  end

  def show
  	@post = Post.find(params[:id])
  end

  private

  def edit_action
    if params[:post_id].present?
      @post = Post.find(params[:post_id])
    else
      @post = Post.new
    end
  end

  def post_params
  	params.require(:post).permit(:title,:text)
  end

end

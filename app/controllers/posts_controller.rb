class PostsController < ApplicationController

  def show
    @posts = Post.all
  end

  def show_my_posts
    @posts = Post.where(user_id: current_user.id).all
    render 'posts/show'
  end

  def new

  end

  def create
    #validate params and request

    # store data in database
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.user_id = params[:user_id]
    @post.created_at = DateTime.current
    @post.updated_at = DateTime.current
    @post.updated_at = DateTime.current
    @post.save

    #redirect
    redirect_to :posts
  end

  def edit

  end

  def update

  end
end

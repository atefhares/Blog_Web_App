class PostsController < ApplicationController

  def index
    @posts = Post.order('created_at DESC').all
  end

  def show_my_posts
    @posts = Post.order('created_at DESC').where(user_id: current_user.id).all
    render 'posts/index'
  end


  def show
    @post = Post.find params[:id]
  end

  def new

  end

  def create
    #validate params and request

    # store data in database
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.user_id = current_user.id
    @post.created_at = DateTime.current
    @post.updated_at = DateTime.current
    @post.save

    #redirect
    if @post.id
      redirect_to :posts
    else
      render 'posts/new'
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    #validate params and request

    # store data in database
    @post = Post.find params[:id]
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]

    @post.updated_at = DateTime.current
    @post.save

    #redirect
    if @post.id
      redirect_to :posts
    else
      render 'posts/new'
    end
  end


  def destroy
    # store data in database
    @post = Post.find params[:id]
    @post.destroy

    #redirect
    redirect_back(fallback_location: root_path)
  end
end

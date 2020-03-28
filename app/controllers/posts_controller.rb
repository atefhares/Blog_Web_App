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
    @post.user_id = params[:user_id]
    @post.created_at = DateTime.current
    @post.updated_at = DateTime.current
    @post.save

    #redirect
    redirect_to :posts
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    #validate params and request

    # store data in database
    @post = Post.find params[:id]
    print "params ", params

    @post.title = params[:post][:title]
    @post.content = params[:post][:content]

    @post.updated_at = DateTime.current
    @post.save

    #redirect
    redirect_to :posts
  end


  def destroy
    #validate params and request

    # store data in database
    @post = Post.find params[:id]
    @post.destroy

    #redirect
    redirect_back(fallback_location: root_path)
  end
end

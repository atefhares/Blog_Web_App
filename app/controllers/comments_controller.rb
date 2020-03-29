class CommentsController < ApplicationController

  def new
    @post = Post.find params[:format]

  end

  def create
    @post = Post.find params[:post_id]

    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.created_at = DateTime.current
    @comment.updated_at = DateTime.current
    @comment.save

    #redirect
    if @comment.id
      redirect_to post_path(@post)
    else
      render 'comments/new'
    end
  end


  def destroy
    @comment = Comment.find params[:id]
    if @comment.user.id == current_user.id
      @comment.destroy
      #redirect
      redirect_back(fallback_location: root_path)
    end
  end
end

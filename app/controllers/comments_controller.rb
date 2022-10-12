class CommentsController < ApplicationController
 before_action :get_post 
  def index
    @comments = @post.comments.all
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_param)
    if @comment.save
      render json: @comment
    else
      render json: @comment
    end
  end

  def show
    if stale?(last_modified: @comment.updated_at,  public: true)
      render json: comment
    end
  end

  def update
    @comment =  @post.comments.find_by(params[:id])
    if @comment.update(comment_param)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment =  @post.comments.find_by(params[:id])
    @comment.destroy
  end

  private

  def get_post
    # byebug
    @post = Post.find(params[:post_id])
  end

  def comment_param
    params.require(:comment).permit(:body, :c, :post_id)
  end
end

class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    # @post = Post.find(params[:id])
    # @post = Post.find_by(params[:comment][:post_id])
    @comment = Comment.create(comment_params)
    if @comment.valid?
      redirect_to post_path(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:post_id,:user_id)
  end

end

class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to post_path(@post)
    else
      render new_comment_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:post_id,:user_id)
  end

end

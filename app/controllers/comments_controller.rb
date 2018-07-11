class CommentsController < ApplicationController


  def create
    binding.pry
    comment = Comment.create(comment_params)
    if user_params[:username] != ""
      user = User.create(user_params)
      user.comments << comment
    end

    redirect_to post_path(comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end

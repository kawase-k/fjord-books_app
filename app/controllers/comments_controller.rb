# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  private

  def set_commentable
    resource, params[:id] = request.path.split('/')[1, 2]

    if resource == "books" || resource == "reports"
      @commentable = resource.singularize.classify.constantize.find(params[:id])
    else
      head :not_found # 404
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    @project.conversation_items.create!(
      type: "CommentItem",
      user: current_user,
      body: params.require(:comment).require(:body)
    )

    redirect_to @project, notice: "Comment added."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end

class StatusChangesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    to_status = params.require(:status_change).require(:to_status)

    ProjectStatusChanger.call(
      project: @project,
      user: current_user,
      to_status: to_status
    )

    redirect_to @project, notice: "Status updated."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end

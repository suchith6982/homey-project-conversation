class ProjectStatusChanger
  def self.call(project:, user:, to_status:)
    new(project: project, user: user, to_status: to_status).call
  end

  def initialize(project:, user:, to_status:)
    @project = project
    @user = user
    @to_status = to_status
  end

  def call
    from_status = @project.status.presence || "new"

    ActiveRecord::Base.transaction do
      @project.update!(status: @to_status)
      @project.conversation_items.create!(
        type: "StatusChangeItem",
        user: @user,
        from_status: from_status,
        to_status: @to_status
      )
    end
  end
end

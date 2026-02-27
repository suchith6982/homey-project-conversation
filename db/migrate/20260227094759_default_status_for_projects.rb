class DefaultStatusForProjects < ActiveRecord::Migration[8.1]
  def change
    change_column_default :projects, :status, from: nil, to: "new"
    change_column_null :projects, :status, false, "new"
  end
end

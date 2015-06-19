class ChangeColumnProjectIdNullToTrueTasks < ActiveRecord::Migration
  def change
    change_column_null :tasks, :project_id, true
  end
end

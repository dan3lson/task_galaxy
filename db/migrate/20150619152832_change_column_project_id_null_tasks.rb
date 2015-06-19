class ChangeColumnProjectIdNullTasks < ActiveRecord::Migration
  def change
    change_column_null :tasks, :project_id, false
  end
end

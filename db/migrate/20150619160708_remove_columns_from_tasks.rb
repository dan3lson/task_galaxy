class RemoveColumnsFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :user_id, :integer
    remove_column :tasks, :project_id, :integer
  end
end

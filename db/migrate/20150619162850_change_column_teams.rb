class ChangeColumnTeams < ActiveRecord::Migration
  def up
    change_column :teams, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :teams, :project_id, 'integer USING CAST(project_id AS integer)'
    change_column :teams, :task_id, 'integer USING CAST(task_id AS integer)'
  end
  def down
    change_column :teams, :user_id, :string
    change_column :teams, :project_id, :string
    change_column :teams, :task_id, :string
  end
end

class CreateTableTeams < ActiveRecord::Migration
  def change
    create_table :teams do |column|
      column.string :user_id
      column.string :task_id
      column.string :project_id
      column.timestamps null: false
    end
  end
end

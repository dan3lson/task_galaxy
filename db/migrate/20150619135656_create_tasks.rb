class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |column|
      column.string :name, null: false
      column.string :description
      column.date :due_date
      column.timestamps null: false
    end
  end
end

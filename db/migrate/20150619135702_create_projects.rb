class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |column|
      column.string :name, null: false
      column.string :description
      column.timestamps null: false
    end
  end
end

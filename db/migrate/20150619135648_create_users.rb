class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |column|
      column.string :first_name
      column.string :last_name
      column.string :email, null: false
      column.string :password, null: false
      column.timestamps null: false
    end
  end
end

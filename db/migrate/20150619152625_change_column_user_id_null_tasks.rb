class ChangeColumnUserIdNullTasks < ActiveRecord::Migration
  def change
    change_column_null :tasks, :user_id, false
  end
end

class ChangeColumnUserIdNullToTrueTasks < ActiveRecord::Migration
  def change
    change_column_null :tasks, :user_id, true
  end
end

class ChangeColumnToDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :members, :is_deleted, from: true, to: false
  end
end

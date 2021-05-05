class ChangeColumnNullTasks < ActiveRecord::Migration[5.2]
  change_column :tasks, :detail, :string, null: false
end

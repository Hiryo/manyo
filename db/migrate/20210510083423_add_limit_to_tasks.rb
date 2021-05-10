class AddLimitToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :limit, :integer
    add_column :tasks, :status, :integer
    add_column :tasks, :expired_at, :datetime
  end
end

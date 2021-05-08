class AddTasksToTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :time, :datetime
  end
end

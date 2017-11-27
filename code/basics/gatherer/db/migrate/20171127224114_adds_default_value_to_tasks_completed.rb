class AddsDefaultValueToTasksCompleted < ActiveRecord::Migration
  def change
    change_column_default(:tasks, :completed, false)
  end
end

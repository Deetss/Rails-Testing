class AddSizeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :size, :integer
  end
end

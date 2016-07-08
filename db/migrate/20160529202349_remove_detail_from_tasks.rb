class RemoveDetailFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :detail, :string
  end
end

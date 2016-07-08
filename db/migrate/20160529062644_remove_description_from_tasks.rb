class RemoveDescriptionFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :description, :string
  end
end

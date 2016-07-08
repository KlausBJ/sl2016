class AddTakenToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :taken, :integer, :default => 0
  end
end

class AddTidToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :tid, :datetime
  end
end

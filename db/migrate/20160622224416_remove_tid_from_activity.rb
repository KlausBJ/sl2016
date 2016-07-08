class RemoveTidFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :tid, :time
  end
end

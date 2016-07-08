class RemoveDagFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :dag, :integer
  end
end

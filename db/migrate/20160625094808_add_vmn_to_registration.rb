class AddVmnToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :vmn, :integer
  end
end

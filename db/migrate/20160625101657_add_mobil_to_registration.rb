class AddMobilToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :mobil, :string
  end
end

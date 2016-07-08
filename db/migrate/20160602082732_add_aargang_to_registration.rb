class AddAargangToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :aargang, :integer
  end
end

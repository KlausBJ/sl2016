class RemoveFornavnFromRegistration < ActiveRecord::Migration
  def change
    remove_column :registrations, :fornavn, :string
  end
end

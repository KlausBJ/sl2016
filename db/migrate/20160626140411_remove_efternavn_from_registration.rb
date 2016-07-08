class RemoveEfternavnFromRegistration < ActiveRecord::Migration
  def change
    remove_column :registrations, :efternavn, :string
  end
end

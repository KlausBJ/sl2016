class AddEfternavnToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :efternavn, :string
  end
end

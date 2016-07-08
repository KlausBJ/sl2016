class AddIndkvarteringToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :indkvartering, :string
  end
end

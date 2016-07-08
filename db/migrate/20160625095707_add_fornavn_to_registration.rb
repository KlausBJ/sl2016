class AddFornavnToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :fornavn, :string
  end
end

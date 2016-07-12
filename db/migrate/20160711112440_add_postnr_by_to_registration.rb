class AddPostnrByToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :postnr, :string
    add_column :registrations, :by, :string
  end
end

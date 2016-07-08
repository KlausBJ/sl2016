class AddKoenToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :koen, :string
  end
end

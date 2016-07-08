class AddRegistrationToAssignments < ActiveRecord::Migration
  def change
    add_reference :assignments, :registration, index: true, foreign_key: true
  end
end

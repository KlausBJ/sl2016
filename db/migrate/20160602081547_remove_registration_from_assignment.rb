class RemoveRegistrationFromAssignment < ActiveRecord::Migration
  def change
    remove_reference :assignments, :registration, index: true, foreign_key: true
  end
end

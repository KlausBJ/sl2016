class RemoveAssignmentFromRegistration < ActiveRecord::Migration
  def change
    remove_reference :registrations, :assignment, index: true, foreign_key: true
  end
end

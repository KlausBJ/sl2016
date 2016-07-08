class AddAssignmentToRegistration < ActiveRecord::Migration
  def change
    add_reference :registrations, :assignment, index: true, foreign_key: true
  end
end

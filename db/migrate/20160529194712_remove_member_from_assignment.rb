class RemoveMemberFromAssignment < ActiveRecord::Migration
  def change
    remove_reference :assignments, :member, index: true, foreign_key: true
  end
end

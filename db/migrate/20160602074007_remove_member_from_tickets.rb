class RemoveMemberFromTickets < ActiveRecord::Migration
  def change
    remove_reference :tickets, :member, index: true, foreign_key: true
  end
end

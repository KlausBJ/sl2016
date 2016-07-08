class AddRegistrationToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :registration, index: true, foreign_key: true
  end
end

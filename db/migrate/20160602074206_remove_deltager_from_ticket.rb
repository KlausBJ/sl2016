class RemoveDeltagerFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :deltager, :string
  end
end

class ChangeNumberInMember < ActiveRecord::Migration
  def change
		change_column :members, :number, :integer
  end
end

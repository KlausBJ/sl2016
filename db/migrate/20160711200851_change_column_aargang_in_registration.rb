class ChangeColumnAargangInRegistration < ActiveRecord::Migration
  def self.up
		change_table :registrations do |t|
			t.change :aargang, :string
		end
  end
	
	def self.down
		change_table :registrations do |t|
			t.change :aargang, :string
		end
	end
end

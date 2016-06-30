class Registration < ActiveRecord::Base
  belongs_to :member, required: true
  belongs_to :ticket_type, required: true
	has_many :assignments
	has_many :tickets
	has_many :activities
	
	def find_by_member_and_name(member, name)
		@fmember = Member.find_by_number(member)
		@registration = Registration.find_by_member_id_and_name(@fmember.id, name)
	end

end

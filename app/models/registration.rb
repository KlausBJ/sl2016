class Registration < ActiveRecord::Base
  belongs_to :member, required: true
  belongs_to :ticket_type, required: true
	has_many :assignments
	has_many :tasks, through: :assignments
	has_many :tickets
	has_many :activities
	
	def find_by_member_and_name(member, name)
		@fmember = Member.find_by_number(member)
		@registration = Registration.find_by_member_id_and_name(@fmember.id, name)
	end
	
	def has_assignment?
		return (assignments.any? or activities.any? or ticket_type.name == "Barn 0-3" or (ticket_type.name == "Barn 4-17" and aargang > 2001))
	end
	
	def priority_tasks
		tmptasks = Array.new
		tickets.each do |ticket|
			ticket.activity.tasks.each do |task|
				if task.taken < task.number
					tmptasks << task
				end
			end
		end
		if tmptasks.count < 8
			missing_tasks = 8 - tmptasks.count
			Task.all.each do |task|
				if !(tmptasks.include?(task))
					missing_tasks -= 1
					tmptasks << task
					break if missing_tasks == 0
				end
			end
		end
		return tmptasks
	end
	
end

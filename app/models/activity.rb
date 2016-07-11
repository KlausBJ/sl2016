class Activity < ActiveRecord::Base
	has_many :tasks
	has_many :tickets
	belongs_to :registration
	
	scope :sted, lambda { |sted|
		where('Sted = ?', sted)
	}
end

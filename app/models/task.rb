class Task < ActiveRecord::Base
		has_many :assignments
		belongs_to :activity
		
		scope :not_taken, -> { joins( :assignments ).group( 'tasks.id' ).having( 'count( task_id ) < ?', 'tasks.number' ) }
end

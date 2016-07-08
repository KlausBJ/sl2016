class Task < ActiveRecord::Base
	require 'squeel'
	has_many :assignments
	belongs_to :activity

	scope :skaane, -> { where('tasks.category = ?', 'S') }
	
	scope :teen, -> { where('tasks.category <> ?', 'S') }
	
	scope :voksen, -> { where('tasks.category = ?', '') }
	
	scope :available, -> { where{ 'tasks.taken < tasks.number' } }
	
	scope :loerdag1, -> { date('2016-07-23') }
	
	scope :soendag, -> { date('2016-07-24') }
	
	scope :mandag, -> { date('2016-07-25') }
	
	scope :ltirsdag, -> { date('2016-07-26') }
	
	scope :onsdag, -> { date('2016-07-27') }
	
	scope :torsdag, -> { date('2016-07-28') }
	
	scope :fredag, -> { date('2016-07-29') }
	
	scope :loerdag2, -> { date('2016-07-30') }
	
	scope :date, lambda { |date| 
		where('date > ? AND date < ?', DateTime.parse(date).beginning_of_day, DateTime.parse(date).end_of_day)
	}
	
	scope :prioritized, -> { order('(number - taken) DESC') }
	
end

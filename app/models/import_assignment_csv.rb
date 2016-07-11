class ImportAssignmentCSV
	include CSVImporter 
	
	model Assignment

	column :name, as: ["navn"], to: ->(name) { name.titleize }
	column :registration, to: ->(registration) { Registration.find_by_name_and_number(registration.split(" - ")[0], registration.split(" - ")[1]) }
	column :task, as: ["opgave"], to: -> (task) { Task.find_by_name }
	column :activity, as: ["title"], to: ->(activity) { Activity.find_by(navn: activity) }
	
	identifier :name, :activity, :date

end

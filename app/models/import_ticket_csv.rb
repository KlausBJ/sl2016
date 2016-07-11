class ImportTicketCSV
	include CSVImporter 
	
	model Ticket

	column :name, as: ["navn"], to: -> (name) { name.titleize }
	column :registration, as: ["medlemsnr"], to: ->(registration) { Registration.new(:member => Member.find_by_number(registration), :ticket_type => TicketType.find_by_name('Autooprettet - Ikke betalt')) }
	column :activity, as: ["annullered d."] ,to: ->(activity) { activity == "" ? Activity.find($activity) : nil }
	
	identifier :registration, :activity
	#:name, 
end

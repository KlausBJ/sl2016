class ImportTicketTypeCSV
	include CSVImporter 
	
	model TicketType

	column :name
	
	identifier :name

end

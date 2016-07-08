class ImportMemberCSV
	include CSVImporter 
	
	model Member

	column :email, as: ["kontakt email"]
	column :number, as: ["medl. nr."]
	column :name, as: ["navn"]
	
	identifier :number

end

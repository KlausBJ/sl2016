class ImportMemberCSV
	include CSVImporter 
	
	model Member

	column :email, as: ["kontakt email"]
	column :number, as: ["medl. nr."]
	column :name, as: ["navn"], to: ->(name) { name.titleize }
	
	identifier :number

end

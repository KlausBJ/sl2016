class ImportActivityCSV
	include CSVImporter 
	
	model Activity

	column :navn, as: ["titel"]
	column :sted
	column :tid
	column :registration, as: ["tovholder"], to: ->(registration) { registration == "" ? nil : Registration.find_by_member_id_and_name(Member.find_by_number(registration.split(" - ")[1]).id, registration.split(" - ")[0].capitalize)	}
	
	identifier :navn

end

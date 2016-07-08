class ImportRegistrationCSV
	include CSVImporter 
	
	model Registration

	column :ticket_type, as: ["billettype"], to: ->(ticket_type) { TicketType.find_by(name: ticket_type) }
	column :member, as: ["medlemsnr"], to: ->(member) { Member.find_by(number: member) }
	column :name, as: ["navn"]
	column :email, as: ["e-mailadresse"]
	column :mobil, as: ["mobilnr"]
	column :aargang, to: -> (aargang) { aargang.split("-")[1] }
	column :vmn, as: [/v.rtsmedlemsnr/i]
	column :indkvartering
	column :koen, as: [/k.n/i], to: ->(koen) { koen.upcase }
	
	identifier :member, :name
		
end

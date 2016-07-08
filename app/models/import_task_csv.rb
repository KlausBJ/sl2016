class ImportTaskCSV
	include CSVImporter 
	
	model Task

	column :name, as: ["opgaver"]
	column :number, as: ["antal"]
	column :activity, as: ["title"], to: ->(activity) { Activity.find_by(navn: activity) }
	column :category, as: ["kategori"]
	column :date, as: ["begin"]
	
	identifier :name, :activity, :date

end

class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy, :ticket_import]
	#require 'CSVImporter'
	helper_method :sort_column, :sort_direction

  def import
		myfile = params[:file]
		contents = myfile.read.force_encoding('UTF-8')
		
		import = ImportActivityCSV.new(content: contents)
		import.run!
		
		redirect_to activities_url, notice: 'Aktiviteter importeret/opdateret.'
	end
	
	def ticket_import
		$activity = @activity
		myfile = params[:activity][:file]
		
		contents = myfile.read.force_encoding('UTF-8')
		
		import = ImportTicketCSV.new(content: contents) do
			after_build do |ticket|
				tmpregistration = Registration.find_by_member_id_and_name(ticket.registration.member_id, ticket.name)
				if tmpregistration.nil? 
					# ikke fundet på den nemme måde
					tmpresult = Registration.where("member_id = ? and lower(name) LIKE ?", ticket.registration.member_id, "#{ticket.name.split(' ')[0].downcase}%")
					if tmpresult.count == 0
						# heller ikke på den svære måde - vi opretter en ny
						ticket.registration.name = ticket.name
						ticket.registration.save
						ticket.registration = Registration.find_by_member_id_and_name(ticket.registration.member_id, ticket.name)
					else
						# fundet på den svære måde - ok
						ticket.registration = Registration.find(tmpresult[0].to_param)
						#ticket.registration.save
						#ticket.registration = Registration.find_by_member_id_and_name(ticket.registration.member_id, ticket.name)
					end
				else
					# fundet på den nemme måde
					p "debug: fundet på den nemme måde..."
					p "debug: name #{ticket.name} medlemsnr #{ticket.registration.member_id}"
					ticket.registration = tmpregistration
				end
				ticket.activity = $activity
			end
		end

		import.run!
		
		$activity = nil
		
		redirect_to activity_url, notice: import.report.message
		#'Billetter importeret/opdateret.'
	end

	def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "navn"
	end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
	
	# GET /activities
  # GET /activities.json
  def index
    @activities = Activity.order("activities.#{sort_column} #{sort_direction}")
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Aktivitet oprettet.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:navn, :sted, :tid, :file)
    end
		
		def sortable_columns
			["navn", "sted", "tid"]
		end
end

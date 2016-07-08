class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy, :assign]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
  end
	
	def assign
		@task = task.find(params[:task])
		Assignment.create(registration: @registration, task: @task)
		@task.taken += 1
		@task.save
		
		redirect_to member_path(@registration.member)
		end
	
  def task_eligible
		@registrations = Array.new
		tempregs = Registration.all
		tempregs.each do |tempreg|
			if tempreg.ticket_type.id == 1
				@registrations << tempreg
			elsif tempreg.ticket_type_id != 5 
				if tempreg.aargang < 2002
					@registrations << tempreg
				end
			end
		end
	end
	
	def import
		myfile = params[:file]
		contents = myfile.read.force_encoding('UTF-8')
		
		import = ImportRegistrationCSV.new(content: contents) do
			after_build do |registration|
				if registration.aargang != "" and not(registration.aargang.nil?)
					p "debug: #{registration.aargang} before"
					if registration.aargang < 17
						registration.aargang += 2000
					elsif registration.aargang < 100
						registration.aargang += 1900
					end
					p "debug: #{registration.aargang} after"
				end
			end
		end
		
		import.run!
		
		redirect_to registrations_url, notice: 'Tilmeldinger importeret/opdateret.'
	end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:name, :member_id, :ticket_type_id)
    end
end

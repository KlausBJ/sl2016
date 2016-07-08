#require 'builder'
#require 'will_paginate'
#include ActionView::Helpers::NumberHelper


class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
	
  # GET /members
  # GET /members.json
  def index
		@filterrific = initialize_filterrific(
			Member, 
			params[:filterrific],
			:select_options => {
				sorted_by: Member.options_for_sorted_by
			}
		) or return
		@members = @filterrific.find.page(params[:page])

		respond_to do |format|
			format.html
			format.js
		end
  end

	def available_tasks(registration) # puttes ned i show? multidim-array?
		@tasks = Array.new
		if registration.ticket_type = 3
			temptasks = Task.teen
		else
			temptasks = Task.voksen
		end
		temptasks.each do |temptask|
			if temptask.assignments.nil?
				@tasks << temptask
			elsif temptask.assignments.count < temptask.number
				@tasks << temptask
			end
		end
		return @tasks
	end
	
	def list
	end
	
	def import
		myfile = params[:file]
		contents = myfile.read.force_encoding('UTF-8')
		
		import = ImportMemberCSV.new(content: contents)
		import.run!
		
		redirect_to members_url, notice: 'Medlemmer importeret/opdateret.'
	end

	def reset_filterrific
		# Clear session persistence
		session[:filterrific_members] = nil
		
		#Redirect back to the index action for default filter settings.
		redirect_to action: :index
	end

	# GET /members/1
  # GET /members/1.json
  def show
		@assignment = Assignment.new
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
			#@registrations = @member.registrations
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:number, :email, :search_query)
    end
end

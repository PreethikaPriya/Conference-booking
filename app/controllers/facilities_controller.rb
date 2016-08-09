class FacilitiesController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def index
		@facilities = Facility.all
	end

	def new
		@facility = Facility.new
	end

	def create
		@facility = Facility.new(facility_params)
		if @facility.save
			redirect_to facilities_path,notice:"successfully added facility"
		else
			render action: "new"
		end	
	end

	def show
		@facility = Facility.find(params[:id])	
		rescue ActiveRecord::RecordNotFound
		redirect_to Facilites_path,notice:"OOPS Record not found"
	end


	def edit
		@facility = Facility.find(params[:id])
	end

	def update
		@facility = Facility.find(params[:id])
		if @facility.update_attributes(facility_params)
			redirect_to facilities_path(@facility.id),notice:"successfully updated facilty"
		else
			render action: "edit"
		end
	end


	def destroy
		@facility = Facility.find(params[:id])
		@facility.destroy
		redirect_to facilities_path,notice:"successfully deleted #{@facility.name}"
	end


	private
	def facility_params
	params[:facility].permit(:name)
	end

end

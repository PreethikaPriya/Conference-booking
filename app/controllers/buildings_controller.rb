class BuildingsController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource

	def index
		@buildings = Building.all
	end

	def new
		@building = Building.new
	end

	def create
		@building = Building.new(building_params)
		if @building.save
			redirect_to buildings_path,notice:"successfully added new building"
		else
			render action: "new"
		end	
	end

	def show
		@building = Building.find(params[:id])
		rescue ActiveRecord::RecordNotFound
		redirect_to buildings_path,notice:"OOPS Record not found"
	end

	def edit
		@building = Building.find(params[:id])
	end

	def update
		@building = Building.find(params[:id])
		if @building.update_attributes(building_params)
			redirect_to buildings_path(@building.id),notice: "successfully updated"
		end
	end

	def destroy
		@building = Building.find(params[:id])
		@building.destroy
		redirect_to buildings_path,notice:"successfully deleted #{@building.name}"
	end


	private
	def building_params
	params[:building].permit(:name,:code,:landmark)
	end



end

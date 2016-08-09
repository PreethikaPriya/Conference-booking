class ConferenceRoomsController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource

	
	def index
	@conference_rooms = ConferenceRoom.all
	 #@conference_rooms = current_user.conferencerooms
	end                            


	def new
	@conference_room = ConferenceRoom.new
	end


	def create 
			@conference_room = ConferenceRoom.new(conference_room_params)
			if @conference_room.save
				redirect_to conference_rooms_path, notice: "successfully created conference room" #goes to index and lists all clients
			else
				render action: "new"
			end
	end

	
	def show
		@conference_room = ConferenceRoom.find(params[:id])
	end


	def edit
		@conference_room = ConferenceRoom.find(params[:id])
	end

	def update
		@conference_room = ConferenceRoom.find(params[:id])
		if @conference_room.update_attributes(conference_room_params)
			redirect_to conference_room_path(@conference_room.id)
		else
			render action: "edit"
		end
	end

	def destroy
		@conference_room = ConferenceRoom.find(params[:id])
		@conference_room.destroy
		redirect_to conference_rooms_path,notice: "successfully deleted #{@conference_room.name}"
	end

	

	private
		def conference_room_params
			params[:conference_room].permit(:name, :building_id, :floor, :landmark, facility_ids:[]) #any values from form which needds to saved in the form needs to be whitelisted in the params
		end

end

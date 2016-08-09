class ConferenceRoomFacility < ActiveRecord::Base

	belongs_to :facility 
	belongs_to :conference_room
	
end

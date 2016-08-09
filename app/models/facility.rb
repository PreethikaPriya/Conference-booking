class Facility < ActiveRecord::Base 
	belongs_to :conferencerooms
	validates_presence_of :name

	has_many :conference_room_facilities
	has_many :conference_rooms, through: :conference_room_facilities

end

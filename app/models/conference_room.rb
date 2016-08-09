class ConferenceRoom < ActiveRecord::Base
	belongs_to :building
	has_many :bookings

	has_many :conference_room_facilities
	has_many :facilities, through: :conference_room_facilities
	before_destroy :destroy_all_bookings
	

	validates_presence_of :name, :building_id, :floor, :landmark


	def destroy_all_bookings
		self.bookings.destroy_all	
	end

end

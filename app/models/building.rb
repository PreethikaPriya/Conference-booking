class Building < ActiveRecord::Base
	has_many :conference_rooms

	before_destroy :delete_all_rooms
	validates_presence_of :name, :code

	def delete_all_rooms
		self.conference_rooms.destroy_all
	end

end

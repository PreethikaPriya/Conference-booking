class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :conference_room

	validates_presence_of :conference_room_id, :start_date_time, :end_date_time
	validate :uniqueness_of_date_range
	#validates_length_of :user_id, is:6
	#validates_numericality_of :user_id



	private
	  def uniqueness_of_date_range
	    errors.add(:start_date, "is not available") unless Booking.where("? >= start_date_time AND ? <= end_date_time AND ? == conference_room_id",
	                                                            start_date_time, start_date_time, conference_room_id).count == 0
	    errors.add(:end_date, "is not available") unless Booking.where("? >= start_date_time AND ? <= end_date_time AND ? == conference_room_id",
	                                                            end_date_time, end_date_time, conference_room_id).count == 0
	  
	    errors.add(:end_date, "end time should be greater than start time") unless  end_date_time >= start_date_time
	  end
	

end

15.times do
	user = User.new
	user.user_name = Faker::Name.first_name 
	user.user_id =  Faker::Number.number(6)
	user.email = Faker::Internet.free_email(user.user_name)
	user.ph_num = Faker::Number.number(10)
	user.save
end




5.times do
	booking = Booking.new
	booking.user_id = User.all.pluck(:user_id).sample
	booking.conference_room_id = ConferenceRoom.all.pluck(:id).sample
	booking.start_date_time = Faker::Time.forward(4, :day)
	booking.end_date_time = booking.start_date_time + 1.hours	
	booking.save	
end	 
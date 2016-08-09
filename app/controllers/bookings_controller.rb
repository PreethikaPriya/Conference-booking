class BookingsController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource

	def index
		#@bookings = Booking.all
		@bookings = current_user.bookings
	end

	def new
		@booking = Booking.new
	end

	def create
		@booking = Booking.new(booking_params)	
		@booking.user_id = current_user.id
		if @booking.save
			Notification.booked(@booking,current_user).deliver!
			redirect_to bookings_path,notice: "successfully booked room"
		else
			render action: "new"
		end
	end

	def show

			@booking = current_user.bookings.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			redirect_to bookings_path,notice: "OOPS!!! No record found"

			#@booking = Booking.find(params[:id])	
		#if current_user.email == "preethikapriya@gmail.com"
		#	@booking = Booking.find(params[:id])
		#else
		#end

	end


	def edit
		#@booking = Booking.find(params[:id])
		@booking = current_user.bookings.find(params[:id])
	end


	def update
		#@booking = Booking.find(params[:id])
		@booking = current_user.bookings.find(params[:id])
		@booking.user_id = current_user.id
		if @booking.update_attributes(booking_params)
			redirect_to bookings_path(@booking.id), notice: "successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		#@booking = Booking.find(params[:id])
		@booking = current_user.bookings.find(params[:id])
		@booking.destroy 
		redirect_to bookings_path,notice:"deleted booking :#{@booking.id} by user : #{@booking.user_id}"
	end

	private
	def booking_params
		params[:booking].permit(:user_id,:conference_room_id,:start_date_time,:end_date_time)
	end

end

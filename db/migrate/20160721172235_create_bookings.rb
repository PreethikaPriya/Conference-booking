class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
    	t.date :start_date_time
    	t.date :end_date_time
    	t.integer :user_id
    	t.integer :conference_room_id
      t.timestamps null: false
    end
  end
end

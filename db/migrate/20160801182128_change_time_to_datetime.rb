class ChangeTimeToDatetime < ActiveRecord::Migration
  def change
  	change_column :bookings, :start_date_time, :datetime 
  	change_column :bookings, :end_date_time, :datetime 
  end
end

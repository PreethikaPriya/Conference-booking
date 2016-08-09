class ChangeStartDateType < ActiveRecord::Migration
  def change
  	change_column :bookings, :start_date_time, :time 
  	change_column :bookings, :end_date_time, :time 
  end
end


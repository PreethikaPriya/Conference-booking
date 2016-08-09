class CreateConferenceRoomFacilities < ActiveRecord::Migration
  def change
    create_table :conference_room_facilities do |t|
    	t.integer :conference_room_id
    	t.integer :facility_id

      t.timestamps null: false
    end
  end
end

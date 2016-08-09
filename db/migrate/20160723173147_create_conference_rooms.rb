class CreateConferenceRooms < ActiveRecord::Migration
  def change
    create_table :conference_rooms do |t|
    	t.string :name
    	t.integer :building_id
    	t.string :floor
    	t.string :landmark
      t.timestamps null: false
    end
  end
end

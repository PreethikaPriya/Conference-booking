class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
    	t.string :name
    	t.string :code
    	t.string :landmark
      t.timestamps null: false
    end
  end
end

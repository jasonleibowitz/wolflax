class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
    	t.string :name
    	t.text :description
    	t.decimal :price
    	t.datetime :date_time
    	t.string :location_name
    	t.string :location_street_one
    	t.string :location_street_two
    	t.string :city
    	t.string :state
    	t.integer :zipcode
    	t.integer :total_spots
    	t.integer :remaining_spots
    	t.timestamps
    end
  end
end

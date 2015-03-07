class RemoveDateTimeAndRemainingSpotsFromCamps < ActiveRecord::Migration
  def change
    remove_column :camps, :date_time
    remove_column :camps, :remaining_spots
  end
end

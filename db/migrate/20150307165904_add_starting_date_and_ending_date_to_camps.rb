class AddStartingDateAndEndingDateToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :starting_date, :date
    add_column :camps, :ending_date, :date
    remove_column :camps, :total_spots
  end
end

class AddGradeToCampers < ActiveRecord::Migration
  def change
    add_column :campers, :grade, :integer
  end
end

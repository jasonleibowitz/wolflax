class AddSchoolToCampers < ActiveRecord::Migration
  def change
    add_column :campers, :school, :string
  end
end

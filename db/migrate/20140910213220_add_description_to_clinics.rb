class AddDescriptionToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :description, :text
  end
end

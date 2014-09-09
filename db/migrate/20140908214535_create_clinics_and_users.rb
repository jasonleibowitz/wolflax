class CreateClinicsAndUsers < ActiveRecord::Migration
  def change
    create_table :clinics_users do |t|
      t.belongs_to :clinic
      t.belongs_to :user
    end
  end
end

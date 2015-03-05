class CreateCampers < ActiveRecord::Migration
  def change
    create_table :campers do |t|
    	t.string :first_name
    	t.string :last_name
    	t.integer :age
    	t.date :dob
    	t.string :street_address_one
    	t.string :street_address_two
    	t.string :city
    	t.string :state
    	t.integer :zipcode
    	t.string :team_name
    	t.string :position
    	t.integer :experience
    	t.integer :mobile_phone
    	t.string :email
    	t.string :insurance_company_name
    	t.string :insurance_policy_number
    	t.string :insurance_policyholder
    	t.string :mother_first_name
    	t.string :mother_last_name
    	t.string :mother_email
    	t.integer :mother_phone
    	t.string :father_first_name
    	t.string :father_last_name
    	t.string :father_email
    	t.integer :father_phone
    	t.boolean :waiver_signed
    	t.references :camp
    	t.string :stripe_charge_token
    end
  end
end

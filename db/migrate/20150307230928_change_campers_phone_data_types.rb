class ChangeCampersPhoneDataTypes < ActiveRecord::Migration
  def change
    remove_column :campers, :mobile_phone
    remove_column :campers, :mother_phone
    remove_column :campers, :father_phone
    add_column :campers, :mobile_phone, :string
    add_column :campers, :mother_phone, :string
    add_column :campers, :father_phone, :string
  end
end

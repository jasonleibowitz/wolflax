class AddReferralToCampers < ActiveRecord::Migration
  def change
    add_column :campers, :referral, :string
  end
end

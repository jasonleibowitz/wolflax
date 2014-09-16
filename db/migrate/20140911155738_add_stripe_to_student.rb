class AddStripeToStudent < ActiveRecord::Migration
  def change
    add_column :students, :stripe_charge_token, :string
  end
end

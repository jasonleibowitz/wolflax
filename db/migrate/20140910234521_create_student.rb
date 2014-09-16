class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.references :clinic
    end
  end
end

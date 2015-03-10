class AddListIdToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :list_id, :string
  end
end

class AddPositionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :position, :string
  end
end

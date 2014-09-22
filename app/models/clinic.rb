class Clinic < ActiveRecord::Base
  validates :name, :price, :date_time, :description, :location_name, :location_street_one, :city, :state, :zipcode, :total_spots, presence: true
  validates :price, :total_spots, numericality: true

  has_and_belongs_to_many :users
  has_many :students

  def update_attendance
    self.remaining_spots = self.total_spots - self.students.length
    self.save!
  end

end

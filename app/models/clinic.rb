class Clinic < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :students

  def update_attendance
    self.remaining_spots = self.total_spots - self.students.length
    self.save!
  end

end

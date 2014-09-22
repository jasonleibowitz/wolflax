class Clinic < ActiveRecord::Base
  validates :name, :price, :date_time, :description, :location_name, :location_street_one, :city, :state, :zipcode, :total_spots, presence: true
  validates :price, :total_spots, numericality: true

  has_and_belongs_to_many :users
  has_many :students

  scope :sold_out, -> { where(remaining_spots: 0) }
  scope :expired, -> { where('date_time < ?', Date.today) }

  def update_attendance
    self.remaining_spots = self.total_spots - self.students.length
    self.save!
  end

  def sold_out?
    if self.remaining_spots == 0
      return true
    else
      return false
    end
  end

  def expired?
    if self.date_time < Date.today
      return true
    else
      return false
    end
  end

end

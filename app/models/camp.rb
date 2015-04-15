class Camp < ActiveRecord::Base
  validates :name, :price, :starting_date, :ending_date, :description, :location_name, :location_street_one, :city, :state, :zipcode, presence: true
  validates :price, numericality: true

  # has_and_belongs_to_many :users
  has_many :campers

  scope :expired, -> { where('date_time < ?', Date.today) }


  def expired?
    if self.ending_date < Date.today
      return true
    else
      return false
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |camper|
        csv << camper.attributes.values_at(*column_names)
      end
    end
  end

  def report_name
    "#{name}: #{starting_date}"
  end

  def google_map_name
    "#{self.location_street_one.split(' ').join('+')}+#{self.city.split(' ').join('+')}+#{self.state.split(' ').join('+')}"
  end

end

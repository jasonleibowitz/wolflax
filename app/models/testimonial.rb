class Testimonial < ActiveRecord::Base
  validates :quote, presence: true

end

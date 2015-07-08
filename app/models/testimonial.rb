class Testimonial < ActiveRecord::Base
  include ActiveModel::Validations
  validates :quote, presence: true
  validates_with TestimonialLimitValidator

  def self.at_capacity?
    self.count >= 10 ? true : false
  end

  def self.empty?
    self.count == 0 ? true : false
  end
end

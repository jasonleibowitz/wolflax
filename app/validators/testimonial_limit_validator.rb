class TestimonialLimitValidator < ActiveModel::Validator
  def validate(record)
    if Testimonial.all.reload.count >= 10
      record.errors[:limit] << "You cannot add more than 10 testimonials. You must delete an existing testimonial before adding another."
    end
  end
end

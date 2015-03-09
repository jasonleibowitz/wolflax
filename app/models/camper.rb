class Camper < ActiveRecord::Base
  belongs_to :camp
  validates :first_name, :last_name, :email, :age, :dob, :street_address_one, :city, :state, :zipcode, :experience, :insurance_company_name, :insurance_policy_number, :insurance_policyholder, :mother_first_name, :mother_last_name, :mother_email, :mother_phone, :father_first_name, :father_last_name, :father_phone, :father_email, :position, :waiver_signed, :school, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :waiver_signed, :acceptance => {:accept => true}

  attr_accessor :stripe_card_token, :amount

  def save_with_payment
    if valid?
      charge = Stripe::Charge.create(
        :amount => self.camp.price.to_i * 100,
        :currency => 'usd',
        :card => stripe_card_token,
        :description => "#{first_name} #{last_name}'s purcahse of #{camp.name} on #{camp.starting_date.strftime "%b %e, %Y at %l:%M %p"}.",
        :receipt_email => email
        )
      self.stripe_charge_token = charge.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating charge: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |camper|
        csv << camper.attributes.values_at(*column_names)
      end
    end
  end


end

class Camper < ActiveRecord::Base
  belongs_to :camp
  validates :email, :position, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

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


end

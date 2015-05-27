class Camper < ActiveRecord::Base
  belongs_to :camp
  validates :first_name, :last_name, :email, :age, :dob, :street_address_one, :city, :state, :zipcode, :experience, :insurance_company_name, :insurance_policy_number, :insurance_policyholder, :mother_first_name, :mother_last_name, :mother_email, :mother_phone, :father_first_name, :father_last_name, :father_phone, :father_email, :position, :waiver_signed, :school, :grade, :referral, :camp_id, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :waiver_signed, :acceptance => {:accept => true}
  before_destroy :issue_refund

  attr_accessor :stripe_card_token, :amount, :flash_notice, :charge_state, :stripe_error_message

  def save_with_payment
    if valid?
        begin
          charge = Stripe::Charge.create(
                  :amount => self.camp.price.to_i * 100,
                  :currency => 'usd',
                  :card => stripe_card_token,
                  :description => "#{first_name} #{last_name}'s purcahse of #{camp.name} on #{camp.starting_date.strftime "%b %e, %Y at %l:%M %p"}.",
                  :receipt_email => email
                  )
          self.stripe_charge_token = charge.id
          self.charge_state = "complete"
        rescue Stripe::CardError => e
          # Since it's a decline, Stripe::CardError will be caught
          body = e.json_body
          err  = body[:error]
          self.charge_state = "failed"
          self.stripe_error_message = err[:message]
        rescue => e
          self.charge_state = "failed"
          self.stripe_error_message = err[:message]
        end
      save!
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

  def issue_refund
    ch = Stripe::Charge.retrieve(self.stripe_charge_token)
    refund = ch.refunds.create
    MailingList.unregister_camp_segment(self)
  end


end

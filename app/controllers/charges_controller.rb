class ChargesController < ApplicationController

  def new

  end

  def create
    binding.pry
    # Stripe.api_key = 'sk_test_vIZ2LXyYOSTNCMW72YZyhibo'
    # token = params[:stripeToken]
    # clinic_id = sessions[:clinic_id]

    # begin
    #   charge = Stripe::Charge.create(
    #     :amount => 1000,
    #     :currency => 'usd',
    #     :card => token,
    #     :description => 'testing 123'
    #     )
    # rescue Stripe::CardError => e
    #   # The card ahsb een declined
    # end
  end


end

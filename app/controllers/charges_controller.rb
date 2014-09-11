class ChargesController < ApplicationController

  def new

  end

  def create
    render text: params.inspect
  #   Stripe.api_key = 'sk_test_vIZ2LXyYOSTNCMW72YZyhibo'
  #   token = params[:stripeToken]

  #   begin
  #     charge = Stripe::Charge.create(
  #       :amount => 1000,
  #       :currency => 'usd',
  #       :card => token,
  #       :description => 'testing 123'
  #       )
  #   rescue Stripe::CardError => e
  #     # The card ahsb een declined
  #   end
  end


end

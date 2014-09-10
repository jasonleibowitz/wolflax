Rails.configuration.stripe = {
  :publishable_key => ENV['WOLF_PUBLISHABLE_KEY'],
  :secret_key      => ENV['WOLF_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

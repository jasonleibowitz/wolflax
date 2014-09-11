Rails.configuration.stripe = {
  # :publishable_key => ENV['WOLF_PUBLISHABLE_KEY'],
  :publishable_key => 'pk_test_zPWECKnej44Flev2zwZDcznJ',
  # :secret_key      => ENV['WOLF_SECRET_KEY']
  :secret_key      => 'sk_test_vIZ2LXyYOSTNCMW72YZyhibo'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

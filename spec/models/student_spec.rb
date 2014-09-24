require "rails_helper"
require 'rspec/rails'
require 'shoulda/matchers'

RSpec.describe Student, :type => :model do

  before(:each) do
    @clinic = Clinic.create(name: 'test clinic', price: 99, date_time: '2014-8-28 20:00:00', location_name: 'test location', location_street_one: '123 street', city: 'new york', state: 'ny', zipcode: 10003, total_spots: 2, description: 'test clinic')
    @jason = Student.create(name: 'Jason Leibowitz', email: 'jason@leibowitz.me', clinic: @clinic, amount: '9900', stripe_card_token: 'tok_14gIN8LQ1x9M8TTLmlbk3kUb')
  end

  # user webmock to simulate API call
  pending "saves a students object with stripe payment" do
    @jason.save_with_payment
    expect(@jason.stripe_charge_token.first(2)).to eq('ch')
  end

end

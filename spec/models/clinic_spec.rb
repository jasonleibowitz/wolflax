require "rails_helper"
require 'rspec/rails'
require 'shoulda/matchers'

RSpec.describe Clinic, :type => :model do

  before(:each) do
    @clinic = Clinic.create(name: 'test clinic', price: 99, date_time: '2014-8-28 20:00:00', location_name: 'test location', location_street_one: '123 street', city: 'new york', state: 'ny', zipcode: 10003, total_spots: 2, description: 'test clinic')
    @jason = Student.create(name: 'Jason Leibowitz', email: 'jason@leibowitz.me', clinic: @clinic)
  end

  it "updates attendance" do
    @clinic.update_attendance
    expect(@clinic.remaining_spots).to eq(1)
  end

  it "returns true if clinic is sold out" do
    expect(@clinic.sold_out?).to eq(false)
    @igor = Student.create(name: 'Igor Yuzo', email: 'igor@yuzo.co', clinic: @clinic)
    @clinic.update_attendance
    expect(@clinic.sold_out?).to eq (true)
  end

  it "returns true if clinic has already taken place" do
    @new_clinic = Clinic.create(name: 'test clinic', price: 99, date_time: DateTime.tomorrow, location_name: 'test location', location_street_one: '123 street', city: 'new york', state: 'ny', zipcode: 10003, total_spots: 2, description: 'test clinic')

    expect(@new_clinic.expired?).to eq(false)
    expect(@clinic.expired?).to eq(true)
  end

  it { should have_many(:students) }
  it { should have_and_belong_to_many(:users) }

end

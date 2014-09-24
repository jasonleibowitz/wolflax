require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ChargesHelper. For example:
#
# describe ChargesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe StatesHelper, :type => :helper do
  it "returns an array of all states" do
    expect(helper.us_states.size).to eq(52)
  end
end

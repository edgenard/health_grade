require "rails_helper"
require_relative "../../../app/etl/destination/write_to_restaurant"

RSpec.describe Etl::Destination::WriteToRestaurant do
  subject(:destination) { described_class.new }

  let(:row) do
    {
      camis: "40819558",
      name: "JAKE'S STEAKHOUSE",
      boro: "BRONX",
      building: "6031",
      street: "BROADWAY",
      zipcode: "10471",
      phone: "7185810182",
      cuisine: "Steak",
      inspection_date: "04/09/2019",
      action: "Violations were cited in the following area(s).",
      violation_code: "04H",
      violation_description: "Raw cooked or prepared food is adulterated "\
      "contaminated cross-contaminated or not discarded in accordance with "\
      "HACCP plan.",
      critical_flag: "Critical",
      score: "",
      grade: "N",
      grade_date: "",
      record_date: "07/13/2019",
      inspection_type: "Cycle Inspection / Initial Inspection",
    }
  end

  let(:expected_attributes) do
    {
      camis: 40819558,
      name: "JAKE'S STEAKHOUSE",
      boro: "BRONX",
      building: 6031,
      street: "BROADWAY",
      zipcode: 10471,
      phone: 7185810182,
      cuisine: "Steak",
    }
  end

  describe "#write" do
    it "saves a new restaurant record" do
      expect { destination.write(row) }.to change(Restaurant, :count).by(1)
    end

    it "persist the restaurant record with the right attributes" do
      destination.write(row)

      restaurant = Restaurant.last

      expect(restaurant).to have_attributes(expected_attributes)
    end
  end
end

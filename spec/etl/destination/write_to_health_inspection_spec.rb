require "rails_helper"
require_relative "../../../app/etl/destination/write_to_health_inspection"

RSpec.describe Etl::Destination::WriteToHealthInspection do
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

  let(:restaurant_attributes) do
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

  let(:health_inspection_attributes) do
    {
      restaurant_id: restaurant.id,
      inspection_date: "04/09/2019",
      action: "Violations were cited in the following area(s).",
      score: nil,
      grade: "N",
      grade_date: "",
      inspection_type: "Cycle Inspection / Initial Inspection",
      record_date: "07/13/2019",
    }
  end

  let!(:restaurant) { FactoryBot.create(:restaurant, restaurant_attributes) }

  describe "#write" do
    it "saves a new restaurant record" do
      expect do
        destination.write(row)
      end.to change(HealthInspection, :count).by(1)
    end

    it "persist the restaurant record with the right attributes" do
      destination.write(row)

      health_inspection = HealthInspection.last

      expect(health_inspection).to have_attributes(health_inspection_attributes)
    end
  end
end

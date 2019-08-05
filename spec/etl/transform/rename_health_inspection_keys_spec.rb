require "rails_helper"
require_relative "../../../app/etl/transform/rename_health_inspection_keys"

RSpec.describe Etl::Transform::RenameHealthInspectionKeys do
  describe "#process" do
    subject(:transform) { described_class.new }

    let(:row) do
      {
        camis: "40819558",
        dba: "JAKE'S STEAKHOUSE",
        boro: "BRONX",
        building: "6031",
         street: "BROADWAY",
         zipcode: "10471",
        phone: "7185810182",
        cuisine_description: "Steak",
        inspection_date: "04/09/2019",
        action: "Violations were cited in the following area(s).",
        violation_code: "04H",
        violation_description: "Raw cooked or prepared food is adulterated "\
        "contaminated cross-contaminated or not discarded in accordance with "\
        "HACCP plan.",
        critical_flag: "Critical",
        score: "",
        grade: "",
        grade_date: "",
        record_date: "07/13/2019",
        inspection_type: "Cycle Inspection / Initial Inspection"
      }
    end

    it "renames keys to match table column names" do
      expect(transform.process(row)).to have_key(:name)
      expect(transform.process(row)).to have_key(:cuisine)
    end

    it 'transform empty grade to N' do
      processed_row = transform.process(row)
      expect(processed_row[:grade]).to eq('N')
    end
  end
end

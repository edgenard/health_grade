require "rails_helper"
require_relative "../../../app/etl/source/nyc_health_inspections"

RSpec.describe Etl::Source::NycHealthInspections do
  let(:input_file) { file_fixture("health_inspection_fixture.csv") }
  let(:bad_input) { file_fixture("bad_input.txt") }
  let(:headers) do
    "CAMIS,DBA,BORO,BUILDING,STREET,ZIPCODE,PHONE,CUISINE DESCRIPTION,"\
    "INSPECTION DATE,ACTION,VIOLATION CODE,VIOLATION DESCRIPTION,"\
    "CRITICAL FLAG,SCORE,GRADE,GRADE DATE,RECORD DATE,INSPECTION TYPE"
  end

  let(:test_csv_path) { "tmp/test.csv" }

  def generate_csv(path, rows)
    CSV.open(path, "w") do |csv|
      rows.each do |row|
        csv << CSV.parse_line(row)
      end
    end
  end

  describe "#each" do
    subject(:source) { described_class.new(test_csv_path) }

    let(:row) do
      "40819558,JAKE'S STEAKHOUSE,BRONX,6031,BROADWAY,10471,7185810182,Steak,"\
      "04/09/2019,Violations were cited in the following area(s).,04H,"\
      "Raw cooked or prepared food is adulterated contaminated "\
      "cross-contaminated or not discarded in accordance with HACCP plan.,"\
      "Critical,,,,07/13/2019,Cycle Inspection / Initial Inspection"
    end
    let(:rows) { [headers, row] }

    before do
      generate_csv(test_csv_path, rows)
    end

    it "outputs the row with headers as symbols" do
      expect { |b| source.each(&b) }.to yield_with_args(
        a_hash_including(:camis, :inspection_type),
      )
    end
  end
end

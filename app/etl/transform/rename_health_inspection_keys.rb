module Etl
  module Transform
    class RenameHealthInspectionKeys
      def process(row)
        row[:name] = row.delete(:dba)
        row[:cuisine] = row.delete(:cuisine_description)
        row[:grade] = 'N' if row[:grade].empty?
        row
      end
    end
  end
end

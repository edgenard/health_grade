module Etl
  module Destination
    class WriteToHealthInspection
      def write(row)
        health_inspection_row = row.slice(
          :inspection_date, :action, :score, :grade,
          :grade_date, :inspection_type, :record_date
        )
        restaurant_id = row[:camis]
        health_inspection_row[:restaurant_id] =
          Restaurant.find(restaurant_id).id

        HealthInspection.find_or_create_by!(health_inspection_row)
      end
    end
  end
end

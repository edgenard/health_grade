module Etl
  module Destination
    class WriteToRestaurant
      def write(row)
        restaurant_row = row.slice(
          :camis, :name, :boro, :building, :street, :zipcode, :phone, :cuisine
        )
        Restaurant.find_or_create_by!(restaurant_row)
      end
    end
  end
end

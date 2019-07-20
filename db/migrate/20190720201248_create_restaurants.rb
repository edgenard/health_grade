class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants, id: false do |t|
      t.integer :camis, primary_key: true
      t.string :name
      t.string :boro
      t.integer :building
      t.string :street
      t.integer :zipcode
      t.integer :phone
      t.string :cuisine

      t.timestamps
    end
  end
end

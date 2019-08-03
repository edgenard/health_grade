class CreateViolations < ActiveRecord::Migration[5.2]
  def change
    create_table :violations do |t|
      t.string :code
      t.text :description
      t.string :critical_flag
      t.references :health_inspection, foreign_key: true

      t.timestamps
    end
  end
end

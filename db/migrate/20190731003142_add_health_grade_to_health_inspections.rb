# frozen_string_literal: true

class AddHealthGradeToHealthInspections < ActiveRecord::Migration[5.2]
  def up
    execute "CREATE TYPE grade AS ENUM ('N', 'P', 'Z', 'C', 'B', 'A')"
    add_column :health_inspections, :grade, :grade
  end

  def down
    remove_column :health_inspections, :grade
    execute "DROP TYPE grade;"
  end
end

# frozen_string_literal: true

class DropViolationColumnsFromHealthInspection < ActiveRecord::Migration[5.2]
  # rubocop:disable Rails/ReversibleMigration
  def change
    change_table :health_inspections, bulk: true do |t|
      t.remove :violation_code
      t.remove :violation_description
      t.remove :critical_flag
    end
  end
  # rubocop:enable Rails/ReversibleMigration
end

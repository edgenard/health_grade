# frozen_string_literal: true

class MakeCamisBigInt < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :camis, :bigint
  end
end

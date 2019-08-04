# frozen_string_literal: true

class Violation < ApplicationRecord
  belongs_to :health_inspection
end

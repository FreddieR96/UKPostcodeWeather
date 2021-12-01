class TemperatureThreshold < ApplicationRecord
  validate :unique_tt_record

  def unique_tt_record
    errors.add(:base, 'Can only be one temperature threshold in database') if TemperatureThreshold.count > 0
  end
end

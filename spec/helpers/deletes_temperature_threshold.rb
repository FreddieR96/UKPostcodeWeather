# frozen_string_literal: true

RSpec.shared_context 'deletes temperature threshold' do
  after(:context) do
    TemperatureThreshold.first.destroy
  end
end

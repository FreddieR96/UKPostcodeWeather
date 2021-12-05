# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TemperatureThreshold, type: :model do
  context 'when one hasnt been added to the database' do
    it 'one can be added' do
      tt = TemperatureThreshold.new(warm_temperature: 9.5, hot_temperature: 19.5).save
      expect(tt).to eq(true)
    end
  end

  context 'when one has been added to the database' do
    include_context 'deletes temperature threshold'
    before(:context) { TemperatureThreshold.create(warm_temperature: 9.5, hot_temperature: 19.5) }
    it 'another one cant be added' do
      tt = TemperatureThreshold.new(warm_temperature: 10.0, hot_temperature: 20.0).save
      expect(tt).to eq(false)
    end
  end
end

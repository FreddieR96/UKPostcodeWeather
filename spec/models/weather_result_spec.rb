# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherResult, type: :model do
  describe 'returns a temperature based on thresholds' do
    context 'when warm is 10C and hot is 20C' do
      include_context 'deletes temperature threshold'
      include_context 'stubs temperature requests'
      before(:context) { TemperatureThreshold.create(warm_temperature: 10.0, hot_temperature: 20.0) }
      it 'correctly gives a cold result' do
        resource = WeatherResult.new('e202st')
        expect(resource.temperature).to eq('cold')
      end
      it 'correctly gives a warm result' do
        resource = WeatherResult.new('sw12ny')
        expect(resource.temperature).to eq('warm')
      end
      it 'correctly gives a hot result' do
        resource = WeatherResult.new('sw1a2aa')
        expect(resource.temperature).to eq('hot')
      end
    end

    context 'when warm is 15C and hot is 25C' do
      include_context 'deletes temperature threshold'
      include_context 'stubs temperature requests'
      before(:context) { TemperatureThreshold.create(warm_temperature: 15.0, hot_temperature: 25.0) }
      it 'correctly gives a cold result' do
        resource = WeatherResult.new('e202st')
        expect(resource.temperature).to eq('cold')
      end
      it 'correctly gives another cold result' do
        resource = WeatherResult.new('sw12ny')
        expect(resource.temperature).to eq('cold')
      end
      it 'correctly gives a hot warm result' do
        resource = WeatherResult.new('sw1a2aa')
        expect(resource.temperature).to eq('warm')
      end
    end
  end

  describe 'returns a valid_uk_status value' do
    include_context 'stubs mixed validity requests'
    it 'returns false for a weatherapi error' do
    end
    it 'returns false for a non-UK postcode' do
      resource = WeatherResult.new('75001')
      expect(resource.valid_uk_postcode).to eq(false)
    end
    it 'returns true for a valid UK postcode' do
      resource = WeatherResult.new('sw12ny')
      expect(resource.valid_uk_postcode).to eq(true)
    end
  end
end

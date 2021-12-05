# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CreateWeatherResults', type: :system do
  include_context 'stubs mixed validity requests'
  include_context 'deletes temperature threshold'

  before(:context) do
    TemperatureThreshold.create(warm_temperature: 10.0, hot_temperature: 20.0)
  end

  scenario 'valid UK postcode' do
    visit root_path
    fill_in 'Postcode', with: 'sw12ny'
    click_button 'Save'

    expect(page).to have_content('The weather in sw12ny will be warm')
  end

  scenario 'valid non-UK postcode' do
    visit root_path
    fill_in 'Postcode', with: '75001'
    click_button 'Save'

    expect(page).to have_content('Please enter a valid UK postcode')
  end

  scenario 'invalid postcode' do
    visit root_path
    fill_in 'Postcode', with: '55'
    click_button 'Save'

    expect(page).to have_content('Please enter a valid UK postcode')
  end
end

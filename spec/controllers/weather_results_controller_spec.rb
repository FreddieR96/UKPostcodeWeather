# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WeatherResultsController, type: :controller do
  include_context 'stubs mixed validity requests'

  it 'show redirects to root if theres no weather_result' do
    get :show
    expect(response).to redirect_to(root_url)
  end

  it 'renders show from a valid UK postcode' do
    post :create, params: { postcode: 'sw12ny' }
    expect(response).to render_template(:show)
  end

  it 'redirects to root if postcode is invalid' do
    post :create, params: { postcode: '75001' }
    expect(response).to redirect_to(root_url)
  end
end

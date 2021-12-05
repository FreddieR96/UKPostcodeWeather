# frozen_string_literal: true

RSpec.shared_context 'stubs temperature requests' do
  before(:example) do
    stub_request(:get, "https://api.weatherapi.com/v1/forecast.json?key=#{ENV['weather_api_key']}&q=e202st")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: {
        'location' => { 'country' => 'UK' },
        'forecast' => { 'forecastday' => [
          { 'day' => { 'maxtemp_c' => 5 } }
        ] }
      }.to_json, headers: { content_type: 'application/json' })

    stub_request(:get, "https://api.weatherapi.com/v1/forecast.json?key=#{ENV['weather_api_key']}&q=sw12ny")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: {
        location: { country: 'UK' },
        forecast: { forecastday: [
          { day: { maxtemp_c: 12.5 } }
        ] }
      }.to_json, headers: { content_type: 'application/json' })

    stub_request(:get, "https://api.weatherapi.com/v1/forecast.json?key=#{ENV['weather_api_key']}&q=sw1a2aa")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: {
        'location' => { 'country' => 'UK' },
        'forecast' => { 'forecastday' => [
          { 'day' => { 'maxtemp_c' => 22.5 } }
        ] }
      }.to_json, headers: { content_type: 'application/json' })
  end
end

RSpec.shared_context 'stubs mixed validity requests' do
  before(:example) do
    stub_request(:get, "https://api.weatherapi.com/v1/forecast.json?key=#{ENV['weather_api_key']}&q=55")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: {
        error: {
          code: 1006,
          message: 'No matching location found.'
        }
      }.to_json, headers: { content_type: 'application/json' })

    stub_request(:get, "https://api.weatherapi.com/v1/forecast.json?key=#{ENV['weather_api_key']}&q=75001")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: {
        location: { country: 'USA' },
        forecast: { forecastday: [
          { day: { maxtemp_c: 25 } }
        ] }
      }.to_json, headers: { content_type: 'application/json' })

    stub_request(:get, "https://api.weatherapi.com/v1/forecast.json?key=#{ENV['weather_api_key']}&q=sw12ny")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: {
        location: { country: 'UK' },
        forecast: { forecastday: [
          { day: { maxtemp_c: 12.5 } }
        ] }
      }.to_json, headers: { content_type: 'application/json' })
  end
end

require 'rack/test'
require_relative '../server'

include Rack::Test::Methods

RSpec.describe LeapYearsServer do
  let(:app) { described_class }

  it 'successfully response to GET "/"' do
    get '/'
    expect(last_response.ok?).to be_truthy
  end

  it 'Calculate leap years for us' do
    post '/', start_year: '1900', end_year: '2000'
    expect(last_response.body).to match(
      LeapYears::Calculator.leap_years(1900, 2000).join(', ')
    )
  end

  it 'show error message when no leap years found' do
    post '/', start_year: '1901', end_year: '1903'
    expect(last_response.body).to match(
      'Високосных дат не найдено.'
    )
  end

  it 'show error message when end date less than start date' do
    post '/', start_year: '1500', end_year: '1000'
    expect(last_response.body).to match(
      'Начальная дата должна быть меньше конечной.'
    )
  end
end

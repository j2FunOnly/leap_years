RSpec.describe 'when not using LeapYear' do
  it 'Fixnum raises NoMethodError' do
    expect { 100.leap_year? }.to raise_error(NoMethodError)
  end
end

using LeapYears::LeapYear

RSpec.describe 'when using LeapYear' do
  it 'return true if year is leap' do
    expect(-42.leap_year?).to be_truthy
    expect(-33.leap_year?).to be_truthy
    expect(8.leap_year?).to be_truthy
    expect(1600.leap_year?).to be_truthy
    expect(2000.leap_year?).to be_truthy
  end

  it 'return false if year is not leap' do
    expect(-41.leap_year?).to be_falsy
    expect(4.leap_year?).to be_falsy
    expect(17.leap_year?).to be_falsy
    expect(1700.leap_year?).to be_falsy
    expect(1900.leap_year?).to be_falsy
  end
end

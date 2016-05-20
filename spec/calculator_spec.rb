RSpec.describe LeapYears::Calculator do
  subject { described_class }

  it 'returns -1 if start year less than end year' do
    expect(subject.leap_years(2000, 1999)).to eq(-1)
  end

  it 'return 0 if no leap years found' do
    expect(subject.leap_years(1101, 1103)).to eq 0
  end

  it 'receive String as arguments' do
    expect(subject.leap_years('2000', '2016')).to be_a Array
  end

  it 'raises error by Bang! method if there no leap years found' do
    expect do
      subject.leap_years!(1101, 1103)
    end.to raise_error(LeapYears::NoLeapYearsError)
  end

  it 'return array if there are any leap year' do
    expect(subject.leap_years(100, 200)).to be_a Array
    expect(subject.leap_years!(100, 200)).to be_a Array
  end
end

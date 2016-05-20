RSpec.describe LeapYears::Calculator do
  subject { described_class.new }

  it 'raises ArgumentError if wrong values assigned' do
    expect { subject.start = -50 }.to raise_error(ArgumentError)
  end

  it 'raises ArgumentError if start less than end' do
    subject.start = 50
    subject.end = 20

    expect { subject.leap_years }.to raise_error(ArgumentError)
  end

  it 'raises ArgumentError if start year missing' do
    subject.start = 50

    expect { subject.leap_years }.to raise_error(ArgumentError)
  end

  it 'raises ArgumentError if end year missing' do
    subject.end = 50

    expect { subject.leap_years }.to raise_error(ArgumentError)
  end

  it 'return false if no leap years found' do
    subject.start = 101
    subject.end = 103

    expect(subject.leap_years).to be_falsy
  end

  it 'raises error by Bang! method if there no leap years found' do
    subject.start = 101
    subject.end = 103

    expect do
      subject.leap_years!
    end.to raise_error(LeapYearCalculator::NoLeapYearError)
  end

  it 'return array if there are any leap year' do
    subject.start = 100
    subject.end = 1500

    expect(subject.leap_years).to be_a Array
    expect(subject.leap_years!).to be_a Array
  end

  describe '#to_s' do
    it 'human readable' do
      subject.start = 1900
      subject.end = 2000

      expect(subject.to_s).to eq('1900 - 2000 гг')
    end
  end
end

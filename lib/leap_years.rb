require_relative 'leap_year'
require_relative 'calculator'

module LeapYearCalculator
  VERSION = '0.0.1'

  class NoLeapYearError < StandardError; end
end

require_relative 'leap_years/leap_year'
require_relative 'leap_years/calculator'

module LeapYears
  VERSION = '0.0.1'

  class NoLeapYearsError < StandardError; end
end

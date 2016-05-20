require_relative 'leap_years/leap_year'
require_relative 'leap_years/calculator'

module LeapYears
  VERSION = '0.0.1'.freeze

  class NoLeapYearsError < StandardError; end
end

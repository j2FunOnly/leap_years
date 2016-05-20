module LeapYears
  module Calculator
    class << self
      using LeapYear
      def leap_years(start_year, end_year)
        start_year = start_year.to_i
        end_year = end_year.to_i

        return -1 unless start_year < end_year

        result = (start_year..end_year).select { |year| year.leap_year? }
        result.any? ? result : 0
      end

      def leap_years!(start_year, end_year)
        result = leap_years(start_year, end_year)
        raise NoLeapYearsError if result == 0 || result == -1
        result
      end
    end
  end
end

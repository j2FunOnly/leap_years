module LeapYears
  module Calculator
    using LeapYear

    def self.leap_years(start_year, end_year)
      unless start_year < end_year
        return -1
      end

      result = (start_year..end_year).select { |year| year.leap_year? }
      result.any? ? result : 0
    end

    def self.leap_years!(start_year, end_year)
      raise NoLeapYearsError unless (result = leap_years(start_year, end_year)).is_a? Array
      result
    end

  end
end

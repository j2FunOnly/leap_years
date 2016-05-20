module LeapYears
  module LeapYear
    # According to Wikipedia
    ROMAN_LEAP_YEARS = [
      -42, -39, -36, -33, -30, -27, -24, -21, -18, -15, -12, -9, 8, 12
    ].freeze

    refine Fixnum do
      def leap_year?
        if self > 1582 # Gregorian calendar
          (self % 400 == 0) ||
            (self % 4 == 0 && self % 100 != 0)
        else # Roman calendar
          (ROMAN_LEAP_YEARS.include? self) ||
            (self > 12 && self % 4 == 0)
        end
      end
    end
  end
end

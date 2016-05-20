module LeapYearCalculator
  module LeapYear
    # По данным Вики
    ROMAN_LEAP_YEARS = [
      -42, -39, -36, -33, -30, -27, -24, -21, -18, -15, -12, -9, 8, 12
    ]

    refine Fixnum do
      def leap_year?
        if self > 1582 # По Григорианскому календарю
          (self % 400 == 0) ||
          (self % 4 == 0 && self % 100 != 0)
        else # По Римскому календарю
          (ROMAN_LEAP_YEARS.include?(self)) ||
          (self > 12 && self % 4 == 0)
        end
      end
    end
  end
end

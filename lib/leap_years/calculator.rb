module LeapYearCalculator
  class Calculator
    def initialize
      @start = nil
      @end = nil
    end

    private def check_year(value)
      if (year = value.to_i) <= -42
        raise ArgumentError.new('Доступны даты с 42 г. д.н.э.')
      end

      year
    end

    def start=(value)
      @start = check_year value
    end

    def end=(value)
      @end = check_year value
    end

    def to_s
      "#{@start} - #{@end} гг"
    end

    using LeapYear

    def leap_years
      raise ArgumentError.new('Не введены даты... ') unless @start && @end
      unless @start < @end
        raise ArgumentError.new('Дата начала должна быть меньше даты конца')
      end

      result = (@start..@end).select { |year| year.leap_year? }
      result.any? ? result : false
    end

    def leap_years!
      raise NoLeapYearError unless result = leap_years
      result
    end

  end
end

require_relative '../leap_years'

module LeapYears
  module Application
    class << self
      def run
        print 'Введите год начала отчета: '
        start_year = gets.to_i

        print 'Введите год конца отчета: '
        end_year = gets.to_i

        print "\nВисокосные года (#{start_year} - #{end_year}): "
        print leap_years(start_year, end_year)
      end

      private

      def leap_years(start_year, end_year)
        years = Calculator.leap_years(start_year, end_year)

        case years
        when 0
          "\n  Високосных лет не найдено."
        when -1
          "\n  Начальная дата должна быть меньше конечной."
        else
          pretty_format_years years
        end
      end

      def pretty_format_years(years)
        years.each_slice(10).reduce('') do |result, slice|
          result << "\n  #{slice.join(', ')}"
        end
      end
    end
  end
end

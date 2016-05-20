require_relative '../leap_years'

module LeapYears
  module Application
    def self.run

      print 'Введите год начала отчета: '
      start_year = gets.to_i

      print 'Введите год конца отчета: '
      end_year = gets.to_i

      print "\nВисокосные года (#{start_year} - #{end_year}): "

      case years = Calculator.leap_years(start_year, end_year)
      when 0
        print "\n Високосных лет не найдено."
      when -1
        print "Начальная дата должна быть меньше конечной."
      else
        years.each_slice(10) { |slice| print "\n  #{slice.join(', ')}"}
      end
    end
  end
end

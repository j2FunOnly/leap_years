require_relative 'leap_year_calculator'

module LeapYearCalculator
  module Application
    def self.run
      calc = Calculator.new

      print 'Введите год начала отчета: '
      calc.start = gets

      print 'Введите год конца отчета: '
      calc.end = gets

      print "\nВисокосные года (#{calc}): "
      if years = calc.leap_years
        years.each_slice(10) { |slice| print "\n  #{slice.join(', ')}"}
      else
        print "\n  В указаном промежутке високосных дат нет"
      end
      puts '.'
    rescue ArgumentError => e
      puts e
    end
  end
end

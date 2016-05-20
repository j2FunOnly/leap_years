require_relative 'leap_year_calculator'
# require 'sinatra/reloader'

class CalcServer < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/' do
    leap_years(params[:start_year], params[:end_year])
    erb :result, layout: false
  end

  private

  def leap_years(start_year, end_year)
    calc = LeapYearCalculator::Calculator.new
    calc.start = start_year
    calc.end = end_year
    @calc_title = calc.to_s
    @result = calc.leap_years
    if @result
      @result = @result.join(', ')
    else
      @result = 'В указанном промежутке дат високосных годов нет.'
    end
  rescue ArgumentError => e
    @result = e.message
  end
end

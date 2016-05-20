require_relative 'lib/leap_years'
require 'sinatra/reloader'

class LeapYearsServer < Sinatra::Base
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
    @calc_title = "#{start_year} - #{end_year}"
    case years = LeapYears::Calculator.leap_years(start_year, end_year)
    when 0
      @result = "Високосных дат не найдено."
    when -1
      @result = "Начальная дата должна быть меньше конечной."
    else
      @result = years
    end

  end
end

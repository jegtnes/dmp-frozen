# Journey controller. Largely deals with interfacing with the scrapers
class JourneyController < ApplicationController
  def index
    date = format_date(params[:date])
    time = format_time(params[:time])
    dep = params[:dep]
    arr = params[:arr]
    dep_arr = params[:dep_arr]
    journey_scraper = JourneyScraper.new(dep, arr, date, time, dep_arr)
    cmd = journey_scraper.call("#{ENV['CASPER_PATH']} #{ENV['SCRAPER_PATH']}")
    @journeys = journey_scraper.parse(cmd)
    redirect_to root_url, alert: :journey_not_found if @journeys.nil?
    @departure_station = get_station_name_from_code(dep)
    @arrival_station = get_station_name_from_code(arr)
  end
end

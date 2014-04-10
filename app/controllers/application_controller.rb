class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def format_date(date)
    Date.parse(date).strftime("%d%m%Y")
  end

  def format_time(time)
    time = Time.zone.parse(time).strftime("%H%M")
  end

  def time_next_half_hour(time)
    time = (time.to_f/1800).ceil*1800
    Time.at(time).strftime("%I:%M %p")
  end

  def get_station_name_from_code(code)
    f = File.read(Rails.public_path.to_s + "/json/rail_stations.json")
    stations = JSON.parse(f)
    stn = stations.detect { |s| s["code"] == code }
    stn['value'] unless stn.nil?
  end
end

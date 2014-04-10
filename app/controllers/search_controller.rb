class SearchController < ApplicationController
  def index
    @currentTime = time_next_half_hour(Time.zone.now)
    @currentDate = Date.today.strftime("%d/%m/%Y")
  end
end

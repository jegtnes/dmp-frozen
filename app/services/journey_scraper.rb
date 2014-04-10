# A helper class to run the Casper.js journey scraper.
class JourneyScraper
  def initialize(departure, arrival, date, time, dep_arr)
    @dep = departure
    @arr = arrival
    @date = date
    @time = time
    @dep_arr = dep_arr
  end

  # Runs Casper.js from the command line, getting back either results or errors
  def call(command)
    # Hides any line of text containing 'CoreText performance note'
    # which is a verbose notice generated in development on OS X.
    # Distracts from any real value of output
    `#{command} #{@dep} #{@arr} #{@date} #{@time} #{@dep_arr} 2>&1 | \
    grep -v "CoreText performance note"`
  end

  # Checks for errors and sorts the data into the format we'd like it in
  def parse(data)
    data = JSON.parse data
    if !data.first['error']
      data.sort { |a, b| a['rtg'] <=> b['rtg'] }
    else
      nil
    end
  end
end

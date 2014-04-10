# Various helper methods related to journeys.
module JourneyHelper
  # A helper method to assign an appropriate rating to a certain journey based
  # on the other alternatives available.
  # Params:
  # * length: The amount of total journeys that are going to be related
  # * index: The current index of this journey
  def journey_rating_class(length, index)
    best_journey = (length * 0.33).round
    good_journey = best_journey + (length * 0.33).round

    if index.between?(0, best_journey - 1)
      class_name = "journey--better #{best_journey} #{best_journey - 1}"
    elsif index.between?(best_journey - 1, good_journey - 1)
      class_name = "journey--good #{good_journey} #{good_journey - 1}"
    else
      class_name = 'journey--bad'
    end
    class_name
  end

  def num_of_changes_or_direct(changes)
    if changes.to_i >= 2
      "#{changes} changes"
    elsif changes.to_i == 1
      "#{changes} change"
    else
      'Direct'
    end
  end
end

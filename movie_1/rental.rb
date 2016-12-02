class Rental
  attr_reader :movie, :days_rentend

  def initialize(movie, days_rentend)
    @movie, @days_rentend = movie, days_rentend
  end
end
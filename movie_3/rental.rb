class Rental
  attr_reader :movie, :days_rentend

  def initialize(movie, days_rentend)
    @movie, @days_rentend = movie, days_rentend
  end

  def charge
    movie.charge(@days_rentend)
  end

  def frequent_renter_points
    movie.frequent_renter_points(days_rented)
  end
end
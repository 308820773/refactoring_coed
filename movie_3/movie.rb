class Movie
 attr_accessor :price_code, :price

 def initialize(title, the_price_obj)
  @title, @price = title, the_price_obj
 end

 def charge(days_rented)
  @price.charge(days_rented)
 end

 def frequent_renter_points(days_rented)
  @price.frequent_renter_points(days_rented)
 end
end
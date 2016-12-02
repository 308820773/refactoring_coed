class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  # 结算单
  def statement
    result = "Rental Record for #{@name}"

    @rentals.each do |ele|
      # show fiqures for this rental
      result += "\t" + ele.movie.title + "\t" + ele.charge.to_s + "\n"
    end

    # add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
    result
  end

  def html_statement
    result = "<h1> Rentals for <em>#{@name}</en></h1>"

    @rentals.each do |ele|
      result += "\t" + ele.movie.title + "\t" + ele.charge.to_s + "\n"
    end
    result += "<p> You owe <em> #{total_charge}</em><p>\n"
    result += "On this rental you earned <em> #{total_frequent_renter_points} </em> frequent renter points"
    result
  end

  private

  def total_charge
    @rentals.inject(0) {|sum, rental| sum + rental.charge}
  end

  def total_frequent_renter_points
    @rentals.inject(0) {|sum, rental| sum + rental.frequent_renter_points}
  end
end

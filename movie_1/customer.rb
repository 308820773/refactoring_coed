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
    total_amount, frequent_renter_points = 0, 0  # 总金额, 积分
    result = "Rental Record for #{@name}"

    @rentals.each do |ele|
      this_amount = 0

      # determine amounts for each line
      case ele.movie.price_code
      when Movie::REGULAR
        this_amount += 2
        this_amount += (ele.days_rented - 2) * 1.5 if ele.days_rented > 2
      when Movie::NEW_RELEASE
        this_amount += ele.days_rented * 3
      when Movie::CHILDRENS
        this_amount += 1.5
        this_amount += (ele.days_rented - 3) * 1.5 if ele.days_rented > 3
      end

      # add frequent renter points
      frequent_renter_points += 1

      # add bonus for a two day new release rental
      if ele.movie.price_code == Movie::NEW_RELEASE && ele.days_rented > 1
        frequent_renter_points += 1
      end

      # show fiqures for this rental
      result += "\t" + ele.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    # add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end
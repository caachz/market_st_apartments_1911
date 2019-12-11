class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    sum_monthly_rent = @units.inject(0) { |sum, unit| sum + unit.monthly_rent.to_f}
    average_monthly_rent = sum_monthly_rent / @units.count
  end

  def renter_with_highest_rent
    highest_rent_payer = @units.sort {|a, b| a.monthly_rent <=> b.monthly_rent}
  end
end

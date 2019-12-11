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
end

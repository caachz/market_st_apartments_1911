class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    @units.inject(0) { |sum, unit| sum + unit.monthly_rent}.to_f / @units.count
  end

  def renter_with_highest_rent
    occupied_units.sort {|a, b| a.monthly_rent <=> b.monthly_rent}.last.renter
  end

  def occupied_units
    @units.reject{|unit| unit.renter == nil}
  end

  def annual_breakdown
    occupied_units.inject({}) do |hash, unit|
      annual_cost = unit.monthly_rent * 12
      hash.merge(unit.renter.name => annual_cost)
    end
  end
end

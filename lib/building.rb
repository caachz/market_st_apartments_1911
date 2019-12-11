class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    sum_monthly_rent = @units.inject(0) { |sum, unit| sum + unit.monthly_rent}.to_f / @units.count
  end

  def renter_with_highest_rent
    rents_sorted = occupied_units.sort {|a, b| a.monthly_rent <=> b.monthly_rent}
    rents_sorted.last.renter    
  end

  def occupied_units
    occupied_units = @units.reject{|unit| unit.renter == nil}
  end

  def annual_breakdown
    annual_breakdown_hash = occupied_units.inject({}) do |hash, unit|
      annual_cost = unit.monthly_rent * 12
      hash.merge(unit.renter.name => annual_cost)
    end
  end
end

class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    @units.inject(0) { |sum, unit| require "pry"; binding.pry}
  end
end

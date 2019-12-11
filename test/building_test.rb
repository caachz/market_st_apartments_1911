require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
  end

  def test_it_starts_with_no_units
    assert_equal [], @building.units
  end

  def test_units_can_be_added
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal @unit1, @building.units[0]
    assert_equal @unit2, @building.units[1]
  end

  def test_it_has_an_average_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal 1099.5, @building.average_rent
  end
end

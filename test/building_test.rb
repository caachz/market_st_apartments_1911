require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'
require './lib/renter'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 3, bedrooms: 2})
    @renter1 = Renter.new("Spencer")
    @renter2 = Renter.new("Jessie")
    @renter3 = Renter.new("Max")
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

  def test_it_can_pull_renter_with_highest_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit1.add_renter(@renter1)
    assert_equal @renter1, @building.renter_with_highest_rent
    @unit3.add_renter(@renter3)
    assert_equal @renter1, @building.renter_with_highest_rent
  end

  def test_it_returns_an_annual_breakdown_for_each_renter
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter1)
    hash1= {"Spencer" => 11988}
    assert_equal hash1, @building.annual_breakdown
    @unit1.add_renter(@renter2)
    hash2 = {"Jessie" => 14400, "Spencer" => 11988}
    assert_equal hash2, @building.annual_breakdown
  end
end

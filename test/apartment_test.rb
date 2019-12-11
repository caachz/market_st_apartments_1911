require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'

class ApartmentTest < Minitest::Test

  def setup
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @renter1 = Renter.new("Jessie")
  end

  def test_it_has_a_unit_number
    assert_equal "A1", @unit1.number
  end

  def test_it_has_a_monthly_rent
    assert_equal 1200, @unit1.monthly_rent
  end

  def test_it_has_a_bathroom_count
    assert_equal 1, @unit1.bathrooms
  end

  def test_it_has_a_bedroom_count
    assert_equal 1, @unit1.bedrooms
  end

  def test_it_starts_with_no_renters
    assert_nil @unit1.renter
  end

  def test_renters_can_be_added
    @unit1.add_renter(@renter1)

    assert_equal @renter1, @unit1.renter
  end
end

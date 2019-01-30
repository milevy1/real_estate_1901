require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_house_has_attributes
    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

end

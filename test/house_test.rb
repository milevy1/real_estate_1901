require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)
  end

  def test_house_has_attributes
    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

  def test_house_add_room_to_rooms_attribute
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_house_rooms_from_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_house_area_with_multiple_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end

  def test_house_price_per_square_foot
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_house_rooms_sorted_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2, @room_3, @room_4], @house.rooms_sorted_by_area
  end

  def test_house_rooms_sorted_by_area_with_order_scrambled
    @house.add_room(@room_4)
    @house.add_room(@room_2)
    @house.add_room(@room_1)
    @house.add_room(@room_3)

    assert_equal [@room_1, @room_2, @room_3, @room_4], @house.rooms_sorted_by_area
  end

  def test_house_rooms_by_category_groups_rooms_into_hash
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    expected = {
      :bedroom => [@room_1, @room_2],
      :living_room => [@room_3],
      :basement => [@room_4]
    }

    assert_equal expected, @house.rooms_by_category
  end

end

class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.select { |room| room.category == category }
  end

  def area
    @rooms.reduce(0) { |x, room| x + room.area }
  end

  def price_per_square_foot
    (@price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort { |room1, room2| room1.area <=> room2.area }
  end

  def rooms_by_category
    @rooms.group_by { |room| room.category }
  end

end

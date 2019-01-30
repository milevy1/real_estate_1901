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

end

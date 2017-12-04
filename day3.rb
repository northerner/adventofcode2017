class Spiral
  def build_spiral(largest_number)
    increment = 2
    current_position = 1
    spiral = []

    while current_position < largest_number
      current_spiral_edge = []
      4.times do
        current_position = current_position + increment
        current_spiral_edge << current_position
      end
      spiral << current_spiral_edge
      increment = increment + 2
    end

    spiral
  end

  def steps(location)
    return 0 if location == 1

    # build array of spiral corner values
    spiral = build_spiral(location)

    # how many steps is location from nearest spiral corner
    distance_from_corner = spiral.last.map{ |x| (x - location).abs }.min

    # steps to corner square increases by 2 with each spiral "layer"
    (spiral.length * 2) - distance_from_corner
  end
end

#spiral = Spiral.new
#[1, 12, 23, 1024].each { |point| puts spiral.steps(point) }

class SpiralAdjacent
  def initialize(max_point)
    @max_point = max_point

    width = Math.sqrt(max_point).ceil
    width = width + 1 if (width % 2 == 0)
    @spiral = Array.new(width) { Array.new(width) { 0 } }

    @y, @x = [width/2, width/2]
    @spiral[@y][@x] = 1
    @y, @x = [@y, @x+1]
    @spiral[@y][@x] = 1
    @direction = "up"
  end

  def draw_spiral
    while @spiral[@y][@x] < @max_point
      update_position
      @spiral[@y][@x] = neighbours_total
      # render
    end

    puts @spiral[@y][@x]
  end

  def neighbours_total
    [@spiral[@y-1][@x-1],
    @spiral[@y-1][@x+1],
    @spiral[@y-1][@x],
    @spiral[@y+1][@x-1],
    @spiral[@y+1][@x+1],
    @spiral[@y+1][@x],
    @spiral[@y][@x-1],
    @spiral[@y][@x+1]].sum
  end

  def update_position
    case @direction
    when "up"
      @y = @y - 1
      if @spiral[@y][@x-1] == 0
        @direction = "left"
      end
    when "left"
      @x = @x - 1
      if @spiral[@y+1][@x] == 0
        @direction = "down"
      end
    when "down"
      @y = @y + 1
      if @spiral[@y][@x+1] == 0
        @direction = "right"
      end
    when "right"
      @x = @x + 1
      if @spiral[@y-1][@x] == 0
        @direction = "up"
      end
    end
  end

  def render
    system "clear"
    puts @spiral.map { |x| x.join(' ') }
  end
end

SpiralAdjacent.new(1024).draw_spiral

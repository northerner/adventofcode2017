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

spiral = Spiral.new
[1, 12, 23, 1024].each { |point| puts spiral.steps(point) }

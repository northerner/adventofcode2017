def step_count(instructions_string)
  instructions = instructions_string.split.map(&:to_i)
  location = 0
  steps = 0
  in_bounds = true

  while in_bounds
    steps = steps + 1
    next_location = instructions[location] + location
    in_bounds = (0..instructions.size-1).include?(next_location)

    if in_bounds
      instructions[location] = instructions[location] + 1
      location = next_location
    end
  end

  steps
end

puts step_count("0 3  0  1  -3")

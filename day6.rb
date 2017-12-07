def reallocate(bank)
  banks = bank.clone
  index = banks.find_index(banks.max)
  blocks_to_reallocate = banks.max
  banks[index] = 0

  blocks_to_reallocate.times do
    index = index + 1
    index = 0 if index == banks.length
    banks[index] = banks[index] + 1
  end

  banks
end

def find_loop(bank, log = [])
  if log.include?(bank)
    log.length - log.find_index(bank)
  else
    next_bank = reallocate(bank)
    find_loop(next_bank, log + [bank])
  end
end

puts find_loop("2 4 1 2".split.map(&:to_i))

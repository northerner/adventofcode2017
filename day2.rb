class Checksum
  def check(spreadsheet)
    spreadsheet.split("\n")
               .map{ |row| row.split(" ").map{ |x| x.to_i } }
               .reduce(0) { |sum, n| sum + (n.max - n.min) }
  end
end

spreadsheet = "5 1 9 5\n"\
              "7 5 3\n"\
              "2 4 6 8\n"

puts Checksum.new.check(spreadsheet)

class Checksum
  def initialize(spreadsheet_string)
    @grid = spreadsheet_string.split("\n")
            .map{ |row| row.split(" ").map{ |x| x.to_i } }
  end

  def check
    @grid.reduce(0) { |sum, n| sum + (n.max - n.min) }
  end

  def divisibles
    @grid.reduce(0) do |sum, n|
      sum + n.permutation(2).map { |a, b| a % b == 0 ? a/b : 0 }.sum
    end
  end
end

spreadsheet = "5 9 2 8\n"\
              "9 4 7 3\n"\
              "3 8 6 5\n"

puts Checksum.new(spreadsheet).check
puts Checksum.new(spreadsheet).divisibles

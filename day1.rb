class Captcha
  def solve(sequence_string)
    sequence = sequence_string.split(//)
    sequence.zip(sequence.rotate)
            .map{ |a,b| a == b ? a.to_i : 0 }
            .sum
  end
end

solver = Captcha.new
["1122", "1111", "1234", "91212129"].each { |x| puts solver.solve(x) }

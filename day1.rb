class Captcha
  def initialize(rotate_steps = 1)
    @steps = rotate_steps
  end

  def solve(sequence_string)
    sequence = sequence_string.split(//)
    sequence.zip(sequence.rotate(@steps))
            .map{ |a,b| a == b ? a.to_i : 0 }
            .sum
  end
end

solver = Captcha.new
["1122", "1111", "1234", "91212129"].each { |x| puts solver.solve(x) }

["1212", "1221", "123425", "123123", "12131415"]
  .each { |x| puts Captcha.new(x.length/2).solve(x) }

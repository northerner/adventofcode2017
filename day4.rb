def valid_passphrase?(passphrase)
  phrases = passphrase.split.map { |x| x.chars.sort.join }
  phrases.count == phrases.uniq.count
end

PHRASES = [
  "abcde fghij",
  "abcde xyz ecdab",
  "a ab abc abd abf abj"
]

puts PHRASES.select{ |phrase| valid_passphrase?(phrase) }.count

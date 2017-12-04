def valid_passphrase?(passphrase)
  passphrase.split.uniq.count == passphrase.split.count
end

PHRASES = [
  "aa bb cc dd ee",
  "aa bb cc dd aa",
  "aa bb cc dd aaa"
]

puts PHRASES.select{ |phrase| valid_passphrase?(phrase) }.count

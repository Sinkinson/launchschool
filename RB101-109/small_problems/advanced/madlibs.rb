# Make a madlibs program that reads in some text from a text file that you have created, and then
# plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and
# prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your
# program, but the text data should come from a file or other external source. Your program should
# read this text, and for each line, it should place random words of the appropriate types into
# the text, and print the result.

class Madlibs
  ADJECTIVES = %w(quick lazy sleepy ugly).freeze
  NOUNS = %w(fox dog head leg).freeze
  VERBS = %w(jumps lifts bites licks).freeze
  ADVERBS = %w(easily lazily noisily excitedly).freeze

  attr_reader :file_data

  def initialize
    @file = File.open('madlibs.txt', 'r')
    @file_data = @file.read
  end

  def output_data
    result = file_data.split(/\s/).map do |word|
      case word
      when /adjective/ then ADJECTIVES.sample
      when /noun/ then NOUNS.sample
      when /verb/ then VERBS.sample
      when /adverb/ then ADVERBS.sample
      else word
      end
    end
    result.join(" ")
  end
end

text = Madlibs.new
puts text.output_data

# option 2
ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end

# this is only feasible if the text file looks like the following:

# The %{adjective} brown %{noun} %{adverb}
# %{verb} the %{adjective} yellow
# %{noun}, who %{adverb} %{verb} his
# %{noun} and looks around.

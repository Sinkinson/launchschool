# Write a program that, given a word, computes the Scrabble score for that word.

# Letter Values

# You'll need the following tile scores:

# Letter	                      Value
# A, E, I, O, U, L, N, R, S, T	  1
# D, G	                          2
# B, C, M, P	                    3
# F, H, V, W, Y	                  4
# K	                              5
# J, X	                          8
# Q, Z	                          10

# How to Score

# Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

# 3 points for C
# 1 point for each A (there are two)
# 3 points for B (there are two)
# 2 points for G
# 1 point for E

# Thus, to compute the final total (14 points), we count:
# 3 + 2*1 + 2*3 + 2 + 1
# => 3 + 2 + 6 + 3
# => 5 + 9
# => 14

class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def valid_word?
    !(word == nil || word.upcase.match(/[^A-Z]/))
  end

  def score
    total = 0
    return total unless valid_word?
    word.upcase.each_char do |letter|
      total += tile_score(letter)
    end
    total
  end

  def self.score(str)
    Scrabble.new(str).score
  end

  def tile_score(letter)
    if ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].include?(letter) then 1
    elsif ['D', 'G'].include?(letter) then 2
    elsif ['B', 'C', 'M', 'P'].include?(letter) then 3
    elsif ['F', 'H', 'V', 'W', 'Y'].include?(letter) then 4
    elsif letter == 'K' then 5
    elsif ['J', 'X'].include?(letter) then 8
    else 10
    end
  end
end

# option 2
class Scrabble
  attr_reader :word

  POINTS = {
    'AEIOULNRST'=> 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
}
  def initialize(word)
    @word = word ? word : ''
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars

    total = 0
    letters.each do |letter|
      POINTS.each do |all_letters, point|
        total += point if all_letters.include?(letter)
      end
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

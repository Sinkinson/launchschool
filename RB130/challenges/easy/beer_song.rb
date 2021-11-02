# Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

class BeerSong
  def self.produce(start, finish)
    result = []
    start.downto(finish) do |num|
      next if num == 0
      word, one, z, s = set_variables(num)
      song = <<~verse
      #{num} bottle#{z} of beer on the wall, #{num} bottle#{z} of beer.
      Take #{one} down and pass it around, #{word} bottle#{s} of beer on the wall.
      verse
      result << song
    end
    return result.join("\n") if finish > 0
    add_last_verse(result)
  end

  def self.set_variables(num)
    word = num == 1 ? "no more" : num - 1
    one = num == 1 ? "it" : "one"
    z = num == 1 ? "" : "s"
    s = num == 2 ? "" : "s"
    [word, one, z, s]
  end

  def self.add_last_verse(result)
    last_verse = <<~l_verse
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    l_verse
    result << last_verse
    result.join("\n")
  end

  def self.lyrics
    produce(99, 0)
  end

  def self.verse(start)
    produce(start, start)
  end

  def self.verses(start, finish)
    produce(start, finish)
  end
end

# option 2
class Verse
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def single_verse
    case bottles
    when 0
      zero_bottle_verse
    when 1
      single_bottle_verse
    when 2
      two_bottle_verse
    else
      default_verse
    end
  end

  private

  def default_verse
    "#{bottles} bottles of beer on the wall, #{bottles}" +
    " bottles of beer.\nTake one down and pass it around, " +
    "#{bottles-1} bottles of beer on the wall.\n"
  end

  def two_bottle_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer " +
    "on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer " +
    "on the wall.\n"
  end

  def zero_bottle_verse
    "No more bottles of beer on the wall, no more bottles " +
    "of beer.\nGo to the store and buy some more, 99 bottles " +
    "of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(number)
    Verse.new(number).single_verse
  end

  def self.verses(start, stop)
    current_verse = start
    result = []

    while current_verse >= stop
      result << "#{verse(current_verse)}"
      current_verse -= 1
    end

    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
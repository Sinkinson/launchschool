# The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

# Diamond for letter 'A':

# A

# Diamond for letter 'C':

#   A
#  B B
# C   C
#  B B
#   A

class Diamond
  def self.make_diamond(char)
    letters = ('A'..char).to_a + ('A'...char).to_a.reverse
    string_length = letters.size
    letters.each_with_object([]) do |letter, obj|
      obj << convert(letter).center(string_length) + "\n"
    end.join
  end

  def self.convert(letter)
    spaces = letter_and_space
    return 'A' if letter == 'A'
    letter + ' ' * spaces[letter] + letter
  end

  def self.letter_and_space
    odds = (0..49).select(&:odd?)
    ('B'..'Z').to_a.zip(odds).to_h
  end
end

# option 2
class Diamond
  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    diamond_width = max_width(letter)

    range.each_with_object([]) do |let, arr|
      arr << make_row(let).center(diamond_width)
    end.join("\n") + "\n"
  end

  private

  def self.make_row(letter)
    return "A" if letter == 'A'
    return "B B" if letter == 'B'

    letter + determine_spaces(letter) + letter
  end

  def self.determine_spaces(letter)
    all_letters = ['B']
    spaces = 1

    until all_letters.include?(letter)
      current_letter = all_letters.last
      all_letters << current_letter.next
      spaces += 2
    end

    ' ' * spaces
  end

  def self.max_width(letter)
    return 1 if letter == 'A'

    determine_spaces(letter).count(' ') + 2
  end
end

# A collection of spelling blocks has two letters per block, as shown in this list:
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.
# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.
  
# Examples:
# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true

def block_word?(string)
  blocks = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'],
          ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

  letters = string.chars.map(&:upcase)
  letters.each do |letter|
    blocks_size = blocks.size
    blocks.each_with_index do |sub_arr, idx|
      blocks.delete_at(idx) if sub_arr.include?(letter)
    end
    return false if blocks_size == blocks.size
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# LS way
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

# first gets an uppercase version of the string
# then uses the none method to iterate through the blocks array
# if any of the elements meet the block criterion it will return false
# if none of the elements meet the block criterion it will return true
# the block simply sees it the string has two or more letters in each spelling block

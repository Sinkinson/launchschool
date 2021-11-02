# Write some code that converts modern decimal numbers into their Roman number equivalents.

# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundredsof years.
# They invented concrete and straight roads and even bikinis. One thing they never discovered though
# was the number zero. This made writing and dating extensive histories of their exploits slightly
# more challenging, but the system of numbers they came up with is still in use today. For example
# the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots
# of straight lines and are hence easy to hack into stone tablets.

# 1   => I
# 10  => X
# 7   => VII
 
# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't
# tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting
# with the left most digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC

# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

class RomanNumeral
  attr_reader :number

  def initialize(num)
    @number = num
  end

  def to_roman
    new_num = '%04d' % number
    numeral = ''
    numeral += convert(:thousands, new_num[0].to_i)
    numeral += convert(:hundreds, new_num[1].to_i)
    numeral += convert(:tens, new_num[2].to_i)
    numeral += convert(:ones, new_num[3].to_i)
    numeral
  end

  def convert(units, num)
    return 'M' * num if units == :thousands
    return '' if num == 0
    numeral_1, numeral_2 = numerals_for_use(units)
    case num
    when 1..3 then numeral_1 * num
    when 4 then numeral_1 + numeral_2
    when 5 then numeral_2
    when 6..8 then numeral_2 + numeral_1 * (num - 5)
    else nine_conversion(units)
    end
  end

  def nine_conversion(units)
    return "CM" if units == :hundreds
    return "XC" if units == :tens
    "IX"
  end

  def numerals_for_use(units)
    return ['C', 'D'] if units == :hundreds
    return ['X', 'L'] if units == :tens
    ['I', 'V']
  end
end

# option 2
class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end

# Your task is to Reverse and Combine Words. It's not too difficult, but there are some things you have to consider.

# So what to do?
  
# Input: String containing different "words" separated by spaces
# 1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
#    (odd number of words => last one stays alone, but has to be reversed too)
# 2. Start it again until there's only one word without spaces
# 3. Return your result...

# Some easy examples:
# Input:  "abc def"
# Output: "cbafed"

# Input:  "abc def ghi 123"
# Output: "defabc123ghi"

# Input:  "abc def gh34 434ff 55_eri 123 343"
# Output: "43hgff434cbafed343ire_55321"

# sdfsdf  wee  sdffg  342234  ftt     given
# fdsfds  eew  gffds  432243  ttf    reverse
# fdsfdseew    gffds432243    ttf    combine
# weesdfsdf    343343sdffg    ftt    reverse
# weesdfsdf343343sdffg        ftt    combine
# gffds343343fdsfdseew        ttf    reverse
# gffds343343fdsfdseewttf            combine

def reverse_and_combine_text(string)
  words = string.split

  loop do
    return words.join if words.size == 1
    words.each(&:reverse!)
    holding_arr = []
    words.each_slice(2) { |pair| holding_arr << pair }
    words = holding_arr.map(&:join)
  end
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"

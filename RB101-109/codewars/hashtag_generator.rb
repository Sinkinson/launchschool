# The marketing team is spending way too much time typing in hashtags.
# Let's help them with our own Hashtag Generator!

# Here's the deal:

# It must start with a hashtag (#).
# All words must have their first letter capitalized.
# If the final result is longer than 140 chars it must return false.
# If the input or the result is an empty string it must return false.

def generateHashtag(str)
  str_arr = str.split(' ').map(&:capitalize)
  str_arr.join.size > 139 || str_arr.empty? ? false : str_arr.join.prepend('#')
end

p generateHashtag(" Hello there thanks for trying my Kata")
p generateHashtag("")
p generateHashtag(" " * 200)
p generateHashtag("Do We have A Hashtag")
p generateHashtag("Codewars")
p generateHashtag("a" * 139)
p generateHashtag("a" * 140)

# put "Four score and" in front of famous words

famous_words = "seven years ago..."

# option 1
"Four score and " + famous_words

# option 2
famous_words.prepend("Four score and ")

# option 3
"Four score and " << famous_words

# option 4
famous_words.insert(0, "Four score and ")

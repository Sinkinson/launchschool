# Shorten the following sentence

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0..38)

# Can also put the element directly into the statement
advice.slice!(0, advice.index('house'))

# See if the name Dino appears in the string below

advice = "Few things in life are as important as house training your pet dinosaur."

advice.match?("Dino")
# not ideal as it would match any substring with Dino in it

# could also use
advice =~ /Dino/

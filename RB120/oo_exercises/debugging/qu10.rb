# We discovered Gary Bernhardt's repository for finding out whether something rocks or not, and decided to adapt it for a simple example.

class AuthenticationError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f
      positive / (positive + negative)
    rescue Exception
      NoScore
    end
  end

  def self.find_out(term)
    binding.pry
    score = Score.for_term(term)
    binding.pry

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

# In order to test the case when authentication fails, we can simply set API_KEY to any string
# other than the correct key. Now, when using a wrong API key, we want our mock search engine
# to raise an AuthenticationError, and we want the find_out method to catch this error and print
# its error message API key is not valid.

# Is this what you expect to happen given the code?
# And why do we always get the following output instead?

# Sushi rocks!
# Rain rocks!
# Bug hunting rocks!

=begin

- The count method does actually raise the error but it never reaches the find_out method to be printed.
- This is because it is caught in the for_term method which does not print out the message but instead
  returns the name of the class NoScore.
- This results in score being set to the name of the class NoScore
- This raises another problem, if score is set to NoScore why isn't the first when clause executed?
  - This means the comparison is NoScore === score
  - Since the left hand side is a class, its implementation is checking: score is_a? NoScore
  - This yields false because it is not an instance of NoScore, so we end up in the else clause
  - This can be fixed by making the rescue clause create an instance of NoScore instead
- So if the API is wrong we want the AuthenticationError to reach the find_out method
  - We can change the rescue operation in for_term to a ZeroDivisionError and let other errors through
  - We can then assign the message raised by the AuthenticationError to a variable and call message on it
- Finally we shouln't rescue the exception class, but the StandardError class instead. The exception class
  is too broad, as it contains system and environment errors that you do not want to throw never mind rescue.

=end

# Have AuthenticationError subclass from StandardError
class AuthenticationError < StandardError; end

# Change the error rescued in the for_term method to a ZeroDivisionError
def self.for_term(term)
  positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
  negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

  positive / (positive + negative)
rescue ZeroDivisionError
  NoScore.new
end

# Change the rescued error in the find_out method to a StandardError and assign the message to a variable
def self.find_out(term)
  score = Score.for_term(term)

  case score
  when NoScore
    "No idea about #{term}..."
  when 0...0.5
    "#{term} is not fun."
  when 0.5
    "#{term} seems to be ok..."
  else
    "#{term} rocks!"
  end
rescue StandardError => e
  e.message
end

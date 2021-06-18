def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end

question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""

# because select_letter returns a string we can chain methods onto the return value

select_letter(question, 'a').size # => 8
select_letter(question, 't').size # => 5
select_letter(question, 'z').size # => 0

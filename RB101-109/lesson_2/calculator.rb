# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
# at the top of file
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  answer = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  answer
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = nil
  loop do
    prompt(MESSAGES['first'])
    number1 = gets.chomp
    if number?(number1)
      break
    else
      prompt(MESSAGES['num'])
    end
  end

  number2 = nil
  loop do
    prompt(MESSAGES['second'])
    number2 = gets.chomp
    if number?(number2)
      break
    else
      prompt(MESSAGES['num'])
    end
  end

   operator_prompt = <<-MSG
   What operation would you like to perform?
   1) add
   2) subtract
   3) multiply
   4) divide
   MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['choose'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The final result is #{result}")

  prompt(MESSAGES['final'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thanks'])

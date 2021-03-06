require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def clear
  system('clear')
end

def print_prompt(msg)
  print "-> #{msg}"
end

def put_prompt(msg)
  puts "-> #{msg}"
end

def valid_positive_float_or_integer?(num)
  valid_integer?(num) || valid_float?(num)
end

def remove_zeros(decimal)
  while decimal[-1] == "0" && decimal.size > 1
    decimal.chop!
  end
end

def valid_float?(num)
  return false if num.to_f.positive? == false
  return false if num.count('.') > 1
  decimal = num.split('.')[-1]
  remove_zeros(decimal)
  float = num.split('.')[0] << '.' << decimal
  float.to_f.to_s == float
end

def valid_integer?(num)
  num.to_i.to_s == num && num.to_i.positive?
end

def valid_apr?(num)
  (num.to_f.to_s == num || num.to_i.to_s == num) && num.to_i >= 0
end

def valid_loan_duration?(num)
  num.to_i.to_s == num && num.to_i >= 0
end

def calculating_message
  put_prompt("Calculating")
  string = '.'
  4.times do |num|
    sleep(0.7)
    puts string * (num + 1)
  end
end

def display_welcome_message
  name = get_name
  clear
  puts "Hi #{name}, welcome to the mortgage calculator"
end

def get_loan_amount
  loop do
    print_prompt(MESSAGES['loan'])
    loan_amount = gets.chomp.delete(',')
    return loan_amount if valid_positive_float_or_integer?(loan_amount)
    put_prompt(MESSAGES['invalid'])
  end
end

def get_apr
  loop do
    print_prompt(MESSAGES['annual'])
    apr = gets.chomp
    return apr if valid_apr?(apr)
    put_prompt(MESSAGES['error'])
  end
end

def get_name
  loop do
    print_prompt(MESSAGES['name'])
    name = gets.chomp
    return name unless name.empty?
    put_prompt(MESSAGES['nope'])
  end
end

def display_results(monthly_p, total_loan_term, total_amount_owed, total_int)
  put_prompt("Payment every month: $#{format('%.2f', monthly_p)}")
  total_term_string = "Total of #{total_loan_term} payments: " \
                      "$#{format('%.2f', total_amount_owed)}"
  put_prompt(total_term_string)
  put_prompt("Total interest: $#{format('%.2f', total_int)}")
  puts ''
end

def duration_message
  put_prompt(MESSAGES['duration'])
  sleep(1)
end

def get_loan_duration
  loop do
    print_prompt("Year(s): ")
    loan_term_years = gets.chomp
    print_prompt("Month(s): ")
    loan_term_months = gets.chomp
    if loan_term_years == '0' && loan_term_months == '0'
      put_prompt(MESSAGES['zero_error'])
      next
    end
    return [loan_term_years, loan_term_months] \
    if valid_loan_duration?(loan_term_years) \
    && valid_loan_duration?(loan_term_months)
    put_prompt(MESSAGES['again'])
  end
end

def calc_monthly_payment(loan_amount, apr, loan_term_years, loan_term_mont)
  total_loan_term = (loan_term_years.to_i * 12) + loan_term_mont.to_i
  monthly_interest = (apr.to_f / 100) / 12
  if apr == '0'
    monthly_payment = loan_amount.to_f / total_loan_term
  else
    monthly_payment = loan_amount.to_f * \
                      (monthly_interest / (1 - (1 + monthly_interest) \
                      **(-total_loan_term)))
  end
  [monthly_payment, total_loan_term]
end

def calculate_results(monthly_payment, total_loan_term, loan_amount)
  total_amount_owed = monthly_payment * total_loan_term
  total_interest = total_amount_owed - loan_amount.to_f
  [total_amount_owed, total_interest]
end

def another_calculation
  put_prompt(MESSAGES['another'])
  loop do
    answer = gets.chomp.downcase
    return true if ['y', 'yes'].include?(answer)
    return false if ['n', 'no'].include?(answer)
    put_prompt(MESSAGES['again'])
  end
end

clear
display_welcome_message

loop do
  sleep(2)
  clear
  loan_amount = get_loan_amount
  clear
  apr = get_apr
  clear
  duration_message
  loan_term_years, loan_term_months = get_loan_duration
  clear
  monthly_payment, total_loan_term = \
    calc_monthly_payment(loan_amount, apr, loan_term_years, loan_term_months)
  total_amount_owed, total_interest = \
    calculate_results(monthly_payment, total_loan_term, loan_amount)
  calculating_message
  clear
  display_results(monthly_payment, total_loan_term, \
                  total_amount_owed, total_interest)
  break unless another_calculation
  clear
end

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

def num_check?(num)
  (num.to_i.to_s == num || num.to_f.to_s == num) && \
    (num.to_i.positive? || num.to_f.positive?)
end

def valid_apr?(num)
  (num.to_f.to_s == num || num.to_i.to_s == num) && num.to_i >= 0
end

def year_month_check?(num)
  num.to_i.to_s == num && num.to_i >= 0
end

clear
name = ''
loop do
  print_prompt(MESSAGES['name'])
  name = gets.chomp
  break unless name.empty?
  put_prompt(MESSAGES['nope'])
end

clear
put_prompt("Hi #{name}, welcome to the mortgage calculator")
sleep(1)

loop do
  loan_amount = nil
  loop do
    print_prompt(MESSAGES['loan'])
    loan_amount = gets.chomp
    break if num_check?(loan_amount)
    put_prompt(MESSAGES['invalid'])
  end

  clear

  apr = nil
  loop do
    print_prompt(MESSAGES['annual'])
    apr = gets.chomp
    break if valid_apr?(apr)
    put_prompt(MESSAGES['error'])
  end

  clear

  loan_term_years = nil
  loan_term_months = nil

  put_prompt(MESSAGES['duration'])
  sleep(1)

  loop do
    print_prompt("Year(s): ")
    loan_term_years = gets.chomp
    print_prompt("Month(s): ")
    loan_term_months = gets.chomp
    break if year_month_check?(loan_term_years) \
    && year_month_check?(loan_term_months)
    put_prompt(MESSAGES['again'])
  end

  clear

  total_loan_term = (loan_term_years.to_i * 12) + loan_term_months.to_i
  monthly_interest = (apr.to_f / 100) / 12
  if apr == '0'
    monthly_payment = loan_amount.to_f / total_loan_term
  else
    monthly_payment = loan_amount.to_f * \
                      (monthly_interest / (1 - (1 + monthly_interest) \
                      **(-total_loan_term)))
  end
  total_amount_owed = monthly_payment * total_loan_term
  total_interest = total_amount_owed - loan_amount.to_f

  put_prompt("Calculating...")
  sleep(2)
  put_prompt("Payment every month: $#{monthly_payment.round(2)}")
  put_prompt("Total of #{total_loan_term} payments: $#{total_amount_owed\
  .round(2)}")
  put_prompt("Total interest: $#{total_interest.round(2)}")

  put_prompt(MESSAGES['another'])
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

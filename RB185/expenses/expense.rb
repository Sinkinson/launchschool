#! /usr/bin/env ruby

require 'pg'
require 'io/console'

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: "expenses")
    setup_schema
  end

  def setup_schema
    sql = <<~QUERY
    SELECT COUNT(*) FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'expenses';
    QUERY
    result = @connection.exec(sql)[0]["count"]
    if result == "0"
      sql_1 = File.open('./schema.sql', 'r') { |file| file.read }
      @connection.exec(sql_1)
    end
  end

  def add_expense
    amount, memo = ARGV[1],  ARGV[2]
    date = Date.today
    abort "You must provide an amount and memo." unless amount && memo
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"
    @connection.exec_params(sql, [amount, memo, date])
  end

  def search_expenses(query)
    sql = "SELECT * FROM expenses WHERE memo ILIKE $1"
    result = @connection.exec_params(sql, ["%#{query}%"])
    display_count(result)
    display_expenses(result) if result.ntuples > 0
  end

  def delete_expense(id)
    sql = "SELECT * FROM expenses WHERE id = $1"
    result = @connection.exec_params(sql, [id])

    if result.ntuples == 1
      sql = "DELETE FROM expenses WHERE id = $1"
      @connection.exec_params(sql, [id])

      puts "The following expense has been deleted:"
      display_expenses(result)
    else
      puts "There is no expense with the id '#{id}'."
    end
  end

  def delete_all_expenses
    @connection.exec("DELETE FROM expenses;")
    puts "All expenses have been deleted."
  end

  def list_expenses
    result = @connection.exec('SELECT * FROM expenses ORDER BY created_on ASC;')
    display_count(result)
    display_expenses(result) if result.ntuples > 0
  end

  def display_count(result)
    count = result.ntuples
    case count
    when 0 then puts "There are no expenses."
    when 1 then puts "There is 1 expense."
    when 2.. then puts "There are #{count} expenses."
    end
  end

  private

  def display_expenses(result)
    result.each do |tuple|
    columns = [ tuple["id"].rjust(3),
                tuple["created_on"].rjust(10),
                tuple["amount"].rjust(12),
                tuple["memo"]
              ]
    puts columns.join(" | ")
    end
    total = result.field_values("amount").map(&:to_f).inject(:+)
    puts "-" * 50
    puts "Total #{total.to_s.rjust(25)}"
  end
end

class CLI
  def initialize
    @application = ExpenseData.new
  end

  def run(commands)
    command = commands.first
    case command
    when nil then display_help
    when 'list' then @application.list_expenses
    when 'add' then @application.add_expense
    when 'search' then @application.search_expenses(commands.last)
    when 'delete' then @application.delete_expense(commands.last)
    when 'clear' then double_check_action
    end
  end

  def double_check_action
    puts "This will remove all expenses. Are you sure? (y/n)"
    response = $stdin.getch
    @application.delete_all_expenses if response.downcase == "y"
  end

  def display_help
    puts <<~HELP
      An expense recording system
  
      Commands:
  
      add AMOUNT MEMO [DATE] - record a new expense
      clear - delete all expenses
      list - list all expenses
      delete NUMBER - remove expense with id NUMBER
      search QUERY - list expenses with a matching memo field
    HELP
  end
end

CLI.new.run(ARGV)

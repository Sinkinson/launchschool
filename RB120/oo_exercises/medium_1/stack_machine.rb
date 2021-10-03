# Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error
# if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack
# is empty). In all error cases, no further processing should be performed on the program.

# You should initialize the register to 0.

class StackError < StandardError ; end
class TokenError < StackError ; end

module Stackable
  def push
    stack << register
  end

  def add
    self.register += stack.pop 
  end

  def subtract
    self.register -= stack.pop
  end

  def mult
    self.register *= stack.pop
  end

  def div
    self.register /= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def pop
    self.register = stack.pop
  end
end

class Minilang
  include Stackable

  COMMANDS = ['PUSH', 'ADD', 'SUB', 'MULT',
              'DIV', 'MOD', 'POP', 'PRINT']

  def initialize(command)
    @command = command
    @stack = []
    @register = 0
  end

  def eval
    command.split.each do |instruction|
      begin
        stack_check(instruction) unless integer?(instruction)
      rescue StackError, TokenError => e
        puts e.message
        return
      end
      valid_command(instruction)
    end
    print_check
  end

  private

  attr_accessor :command, :stack, :register

  def print_check
    commands = command.split
    unless commands.include?('PRINT')
      puts "(nothing printed; no PRINT commands)"
    end
  end

  def valid_command(instruction)
    if integer?(instruction)
      self.register = instruction.to_i
      return
    end
    command_processor(instruction)
  end

  def integer?(instruction)
    instruction.to_i.to_s == instruction
  end

  def stack_check(instruction)
    if instruction == 'POP' && stack.empty?
      raise StackError.new("Empty stack!")
    elsif !COMMANDS.include?(instruction)
      raise TokenError.new("Invalid Token: #{instruction}")
    end
  end

  def command_processor(instruction)
    case instruction
    when 'PUSH'  then push
    when 'ADD'   then add
    when 'SUB'   then subtract
    when 'MULT'  then mult
    when 'DIV'   then div
    when 'MOD'   then mod
    when 'POP'   then pop
    when 'PRINT' then puts register
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

# LS solution

require 'set'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  ACTIONS = Set.new %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval
    @stack = []
    @register = 0
    @program.split.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push
    @stack.push(@register)
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end

  def add
    @register += pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
  end

  def mult
    @register *= pop
  end

  def sub
    @register -= pop
  end

  def print
    puts @register
  end
end

=begin

- A Set object is used for the actions, which stores them in a hash
  - #<Set: {"PUSH", "ADD", "SUB", "MULT", "DIV", "MOD", "POP", "PRINT"}
- A error class is created which two others subclass from, making it easier to rescue those errors
  - This is because the subclass errors -- BadTokenError and EmptyStackError -- are raised when running eval_token.
    And if raised the method terminates there and goes straight to the rescue clause
- If the action is included in our Set object then the Object#send method is used to call the relevant method
- Otherwise the regex statement checks to see if the command is an integer, else it raises a BadTokenError
- One of the key differentiators here is that the initial argument is saved to the instance variable program and
  then it is the eval method that initializes the stack and register.

=end

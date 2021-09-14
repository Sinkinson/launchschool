# We created a simple BankAccount class with overdraft protection, that does not allow a withdrawal greater than the amount of the
# current balance. We wrote some example code to test our program. However, we are surprised by what we see when we test its
# behavior. Why are we seeing this unexpected output? Make changes to the code so that we see the appropriate behavior.

class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0

      success = (self.balance -= amount) # same as self.balance = self.balance - amount
    else
      success = false
    end

    if success
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    if valid_transaction?(new_balance)
      @balance = new_balance
      true
    else
      false
    end
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50

# Setter methods always return the argument that was passed in, even when an explicit return is inside the method.
# Therefore the balance= method will therefore always return its argument, regardless of whether or not the instance
# variable @balance is re-assigned. Therefore the invocation on line 27 will have a truthy return even when our setter
# method does not reassign @balance.

# It's also important to note how balance= is being invoked as it is hidden by syntactical sugar.
# self.balance -= amount is the same as self.balance = self.balance - amount or self.balance=(self.balance - amount)
# So you can see we are passing in the current balance minus the amount we wish to subtract.

# So in the first instance where we invoke self.balance += amount we have 50 as the amount and self.balance as 0
# Therefore when this comes to the valid_transaction? method we are passing in 50. Therefore, @balance = new_balance
# is invoked. But the balance= would have returned the argument regardless, so it wasn't the next true statement returned.

# On the next invocation on line 27 we are passing in self.balance - amount into the balance= method, which is -30.
# The valid_transaction? method therefore does not return true so @balance = new_balance is never invoked, so the balance stays
# as 50 but the balance= method returns -30, therefore success is set to true and that's why we have the incorrect output.

# In order to correct this we need to change the balance= method so it just changes to the new_balance. We then need to pass the
# new balance into the valid_transaction? method before we invoke balance=
# The new methods would look something like this:

class BankAccount
  # code omitted

 def withdraw(amount)
   if amount > 0 && valid_transaction?(balance - amount)
     self.balance -= amount
     "$#{amount} withdrawn. Total balance is $#{balance}."
   else
     "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
   end
 end

 def balance=(new_balance)
   @balance = new_balance
 end

 # code omitted
end

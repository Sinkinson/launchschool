# Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# The mistake is that we firstly do not have a setter method for quantity, we only have a getter method. The second
# mistake is that quantity is called without appending self. This will simply create a local variable called quantity
# inside the update_quantity method.

# So we have a few options, we could change attr_reader to attr_accessor and call self.quantity within the update_quantity
# method. Or we could reference the quantity instance variable directly using @, which would bypass the need to create a
# setter.

order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]

customer_orders = {}

order_data.each do |row|
  if customer_orders.has_key?(row[:customer_id])
    customer_orders[row[:customer_id]][:orders] << { 
      order_fulfilled: row[:order_fulfilled], # this adds a new hash of order_fulfilled and order_value to the exisiting key :orders
      order_value: row[:order_value]
    }
  else
    customer_orders[row[:customer_id]] = {
      customer_id: row[:customer_id],
      customer_name: row[:customer_name],
      orders: [
        {
          order_fulfilled: row[:order_fulfilled],
          order_value: row[:order_value]
        }
      ]
    }
  end
end

customer_orders = customer_orders.values

# what we do in the above is ask whether the customer_order hash has the customer_id key
# if it doesn't contain that key it populates the hash with the necessary data
# then on the next iteration the hash will have that key if there is more than one order for
# that customer therefore it adds just the order_fulfilled and order_value to the existing
# order hash for that customer

# customer_orders = [
#   {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#     orders: [
#       { order_fulfilled: true, order_value: 135.99 },
#       { order_fulfilled: true, order_value: 289.49 },
#       { order_fulfilled: false, order_value: 58.00 }
#     ]
#   },
#   {
#     customer_id: 32,
#     customer_name: 'Michael Richards',
#     orders: [
#       { order_fulfilled: true, order_value: 120.00 },
#       { order_fulfilled: false, order_value: 85.65 }
#     ]
#   },
#   # rest of data...
# ]

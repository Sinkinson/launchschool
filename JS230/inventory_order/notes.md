So what even if this form doing?
- dynamically add order lines to an inventory order form
  - done through add item button
- delete a line item using a Delete link on that item

Currently each order line is created by using jQuery to perform string replacement using
some pre-defined HTML, which can be seen below:

<script type="text/template" id="inventory_item">
  <tr>
    <td>
      <input type="hidden" name="item_id_ID" value="ID" />
      <label for="item_name_ID">Name</label>
      <input name="item_name_ID" type="text" />
    </td>
    <td>
      <label for="item_stock_number_ID">Stock Number</label>
      <input name="item_stock_number_ID" type="text" maxlength="8" />
    </td>
    <td>
      <label for="item_quantity_ID">Quantity</label>
      <input name="item_quantity_ID" type="number" value="1" />
    </td>
    <td>
      <a href="#" class="delete">Delete</a>
    </td>
  </tr>
</script>

We need to replace this template with a handlebards template

Order date
- we select the dd element by the id of order_date and then set its text content
  to the string version of the date
- this is done immediately upon the form loading

CacheTemplate
- This method removes the template element from the DOM and saves it in a variable
- so this removes the script element that holds the template from the HTML
- it then assigns the HTML contained within this template to a property on the
  inventory object for later use

add
- increments the last id property by 1
- creates an item object -- which is empty of most values bar id
- this item object is then pushed to the collection property
- finally the item object is returned

remove
- passed a number as an argument
- then reassigns the collection to the filtered version that exludes the item that has
  the same id as the number passed in

get
- passed an id as an argument
- iterates through the collection
- assigns the item to a variable if the id matches the argument passed in
- returns the variable whether an item has been assigned to it or not

update
- passed what appears to be a jQuery object as indicated by having parameter start with $
- uses the findID method to get the id of the jQuery object
- then uses the get method to get the item from the collection using the id
- it them uses the jquery object to find the input values
  - this is done using regex in the selector, it is saying if the attribute name starts with item_name select it and
    then get its value using val()
- the items name, stock_number and quantity are all updated in this manner

newItem
- passed an event as an argument
- default behaviour is immediately prevented
- a new empty object is then added to the collection through add()
  - the return value is assigned to item
- We then create a jQuery object and assign it to the local variable $item
  - we get the template property which as we know is is the HTML from the script
    which is just a table row
  - within this template we then replace all the ID values with the item id
  - this means $item now points to a jQuery object which holds a tr element that
    has the correct id values within its attribute values
- finally the table element is selected using its inventory id and the item is appended
  so essentially the tr is appended to the table.
  - As we know when appended this table row is empty of data but the id values in
    the attributes correspond to an empty item added to the collection property

findParent
- this takes an event as an argument
- we then get the target of the event, so what element the event occured on
- we convert this to a jQuery object so that we can call the closest method
  on this element and then we find the closest tr (table row) and return it

findID
- take a jQuery object as an argument
- this looks for the input element within the template that has an
  type attribute of hidden. The value of this has been set to the value
  of the corresponding object in the collection property
- it simply gets the id value and returns it

deleteItem
- takes and event object as an argument
- prevents the default action for this event
- calls find parent and passes event object
  - this returns a tr element as a jQuery object
  - we then call remove() on that jQuery object to remove it from the DOM
- we then call the this.remove() method to remove this item from the collection

updateItem
- takes an event as an argument
- calls the findParent method and passes the event as an argument
- calls the update method and passes the jQuery object assigned to
  $item in
  - this is a tr element

bindEvents
- gets the add item button and attaches a click event handler
  - the .proxy method takes a function and a context
  - it returns a new function that will always have the given context set
  - this ensures that when the event handler is called it does not lose the
    inventory object as context -- so `this` will always reference it
- Adds a click event handler to the table element, but it will only trigger if the element
  clicked is the delete anchor element
  - the event handler is the deleteItem function
- Add another click event handler onto the table element to handle the blur event
  - the blur event occurs when the element loses focus
    - so when we are no longer interacting with the table row
  - the :input selector selects all form controls
  - the event handler is the updateItem method

init
- setDate method is called
- cacheTemplate method is called
- bindEvents method called

$($.proxy(inventory.init, inventory));
- this line just initialises the object and ensure the context is the inventory object

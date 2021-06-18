# looking at different delete methods for arrays

numbers = [1, 2, 3, 4, 5]

# assume they are reset between calls

numbers.delete_at(1)
# deletes the value at index 1
# this is destructive at the return value of 
# the call is 2
# output would be [1, 3, 4, 5]

numbers.delete(1)
# deletes the actual element 1
# this is destructive also and returns the element 1
# output would be [2, 3, 4, 5]

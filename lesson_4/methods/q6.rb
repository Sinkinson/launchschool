# what is the return value of the following statement. Why?

['ant', 'bear', 'caterpillar'].pop.size

# pop destructively removes the last item in the array and returns it
# we are then calling size on that return, which will provide the number
# of characters in the string 'caterpillar'
# => 11

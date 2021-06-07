def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# what would be the return value of the following method invocation?
# => "no"
# because the value returned from the foo method will always be "yes" and
# "yes" == "no" will be false

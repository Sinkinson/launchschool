# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result,
# the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution
# is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.
# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
fibonacci(100_001) => 4202692702.....8285979669707537501

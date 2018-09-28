# starting number is 1 (not 0) in requirement
# pattern presented: 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610

require 'benchmark'

def fibonacci(n)
  if n <= 2
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

def fib(n, memo = {})
  if n <= 2
    1
  else
    memo[n] ||= fib(n - 1, memo) + fib(n - 2, memo)
  end
end

Benchmark.bm do |x|
  x.report('fibonacii(15): ') { fibonacci(15) }
  x.report('fib(15):       ') { fib(15) }
  x.report('fib(1000):     ') { fib(1000) }
end

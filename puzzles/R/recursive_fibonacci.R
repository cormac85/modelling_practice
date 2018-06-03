recursive_fibonacci <- function(n) {
  if(n >= 0){
    if (n == 1 | n == 0)
      n
    else if(n > 30)
      stop("Input too large, consider alternative implementations of Fibonacci number calculations.")
    else
      as.integer(recursive_fibonacci(n - 2) + recursive_fibonacci(n - 1))
  } else {
    as.integer(((-1)^(n+1)) * recursive_fibonacci(-n))
  }
}

# purrr::map_dbl(0:10, recursive_fibonacci)

# F(−n)=(−1)n+1F(n)

# if n <= -1:
#   return ((-1)**(n+1)) + fib(-n)

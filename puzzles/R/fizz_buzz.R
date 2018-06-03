
fizz_buzz <- function(n, triggers = data.frame(numbers = c(3,5), names = c("fizz","buzz"))) {
  # Write a program that prints the numbers from 1 to 100.
  # But for multiples of three print "Fizz" instead of the number
  # and for the multiples of five print "Buzz".
  # For numbers which are multiples of both three and five print "FizzBuzz".

  divisible_by <- function(n1, n2) {
    (n1 %% n2) == 0
  }

  triggers$names <- as.character(triggers$names)

  fizz <- divisible_by(n, triggers$numbers[1])
  buzz <- divisible_by(n, triggers$numbers[2])
  fizz_word <- triggers$names[1]
  buzz_word <- triggers$names[2]

  if(fizz & buzz)
    paste0(fizz_word, buzz_word)
  else if(buzz)
    buzz_word
  else if (fizz)
    fizz_word
  else
    n
}


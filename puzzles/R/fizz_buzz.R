
fizz_buzz <- function(n, triggers = data.frame(numbers = c(3,5), names = c("fizz","buzz"))) {
  # Write a program that prints the numbers from 1 to 100.
  # But for multiples of three print "Fizz" instead of the number
  # and for the multiples of five print "Buzz".
  # For numbers which are multiples of both three and five print "FizzBuzz".

  # TODO If you REALLy want to make this completely generlised, allow the check function
  # (in the normal case this is the divisible_by function) to be paramaterised.

  divisible_by <- function(n1, n2) {
    (n1 %% n2) == 0
  }

  triggers$names <- as.character(triggers$names)

  trigger_checks <- purrr::map2_lgl(n, triggers$numbers, divisible_by)

  trigger_result <- paste0(triggers$names[trigger_checks], collapse = "")
  if (trigger_result == "")
    trigger_result <- n

  return(trigger_result)
}


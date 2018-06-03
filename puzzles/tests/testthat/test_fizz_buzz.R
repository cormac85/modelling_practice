context("Fizz Buzz")

testthat::test_that("basic fizzbuzz works", {
  expect_equal(purrr::map_chr(1:10, fizz_buzz),
               c(1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz"))
})

testthat::test_that("fizzbuzz can take different denominators", {
  expect_equal(purrr::map2_chr(1:20,
                               list(data.frame(numbers = c(4,5), names = c("fizz","buzz"))),
                               fizz_buzz),
               c(1, 2, 3, "fizz", "buzz", 6, 7, "fizz", 9, "buzz",
                 11, "fizz", 13, 14, "buzz", "fizz", 17, 18, 19, "fizzbuzz"))
})

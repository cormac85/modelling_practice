context("Fizz Buzz")

testthat::test_that("basic fizzbuzz works", {
  expect_equal(purrr::map_chr(1:15, fizz_buzz),
               c(1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz",
                 11, "fizz", 13, 14, "fizzbuzz"))
})

testthat::test_that("fizzbuzz can take different denominators", {
  expect_equal(purrr::map2_chr(1:20,
                               list(data.frame(numbers = c(4,5), names = c("fizz","buzz"))),
                               fizz_buzz),
               c(1, 2, 3, "fizz", "buzz", 6, 7, "fizz", 9, "buzz",
                 11, "fizz", 13, 14, "buzz", "fizz", 17, 18, 19, "fizzbuzz"))
})

testthat::test_that("fizzbuzz can take different denominators and names", {
  expect_equal(purrr::map2_chr(1:12,
                               list(data.frame(numbers = c(3,4), names = c("fuzz","bizz"))),
                               fizz_buzz),
               c(1, 2, "fuzz", "bizz", 5, "fuzz", 7, "bizz", "fuzz", 10,
                 11, "fuzzbizz"))
})

testthat::test_that("fizzbuzz can take arbitrary lengths of triggers", {
  expect_equal(purrr::map2_chr(as.integer(c(1:15, 20, 60)),
                               list(data.frame(numbers = c(3, 4, 5),
                                               names = c("fuzz","bizz", "cuzz"))),
                               fizz_buzz),
               c(1, 2, "fuzz", "bizz", "cuzz", "fuzz", 7, "bizz", "fuzz", "cuzz",
                 11, "fuzzbizz", 13, 14, "fuzzcuzz", "bizzcuzz", "fuzzbizzcuzz"))
})

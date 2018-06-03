context("Fibonacci")

test_that("basic fibonacci works", {
  expected <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55)
  expect_equal(purrr::map_int(0:10, recursive_fibonacci), expected)
})

test_that("fibonacci returns error for large input", {
   expect_error(recursive_fibonacci(31), "Input too large, consider alternative implementations of Fibonacci number calculations.")
})

test_that("negative fibonacci numbers are correctly calculated", {
  expected <- c(-8,5,-3,2,-1,1,0,1,1,2,3,5,8)
  
  expect_equal(purrr::map_int(-6:6, recursive_fibonacci), expected)
})
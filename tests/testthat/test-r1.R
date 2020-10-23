test_that("Valid color", {
  expect_error(ic(id, color = NULL))
  expect_error(ic(id, color = ""))
})

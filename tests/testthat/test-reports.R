test_that("sportsdataverse_packages() works", {
  skip_on_cran()
  expect_identical(
    sportsdataverse_packages(include_self = TRUE),
    sort(c(core,"sportsdataverse"))
  )
  expect_identical(
    sportsdataverse_packages(include_self = FALSE),
    sort(core)
  )
})

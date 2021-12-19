test_that("sportsdataverse_packages() works", {
  skip_on_cran()
  expect_identical(
    sportsdataverse_packages(include_self = TRUE),
    c("cfbfastR", "fastRhockey",
      "hoopR","wehoop","worldfootballR","sportsdataverse")
  )
  expect_identical(
    sportsdataverse_packages(include_self = FALSE),
    c("cfbfastR", "fastRhockey",
      "hoopR","wehoop","worldfootballR")
  )
})

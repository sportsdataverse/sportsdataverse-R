test_that("sportsdataverse_deps() reports the member packages themselves", {
  skip_on_cran()
  skip_if_offline()
  deps <- sportsdataverse_deps(
    recursive = FALSE,
    repos = c(CRAN = "https://cloud.r-project.org")
  )
  expect_true(all(core %in% deps$package))
})

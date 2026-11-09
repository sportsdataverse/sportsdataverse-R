test_that("msg() sends a plain message outside of startup", {
  skip_on_cran()
  expect_message(msg("hello"), "hello")
})

test_that("text_col() passes text through when RStudio isn't running", {
  skip_on_cran()
  local_mocked_bindings(isAvailable = function(...) FALSE, .package = "rstudioapi")
  expect_identical(text_col("x"), "x")
})

test_that("text_col() passes text through when RStudio has no theme API", {
  skip_on_cran()
  local_mocked_bindings(
    isAvailable = function(...) TRUE,
    hasFun = function(...) FALSE,
    .package = "rstudioapi"
  )
  expect_identical(text_col("x"), "x")
})

test_that("text_col() colours text for the RStudio theme", {
  skip_on_cran()
  old <- options(crayon.enabled = TRUE, crayon.colors = 256)
  on.exit(options(old), add = TRUE)
  dark <- TRUE
  local_mocked_bindings(
    isAvailable = function(...) TRUE,
    hasFun = function(...) TRUE,
    getThemeInfo = function(...) list(dark = dark),
    .package = "rstudioapi"
  )
  expect_identical(as.character(text_col("x")), as.character(crayon::white("x")))
  dark <- FALSE
  expect_identical(as.character(text_col("x")), as.character(crayon::black("x")))
})

test_that("invert() swaps names and values", {
  skip_on_cran()
  expect_null(invert(list()))
  out <- invert(list(a = c("f", "g"), b = "f"))
  expect_identical(out[["f"]], c("a", "b"))
  expect_identical(out[["g"]], "a")
})

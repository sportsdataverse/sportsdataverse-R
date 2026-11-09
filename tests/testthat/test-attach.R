test_that("sportsdataverse_attach() is silent when every member is attached", {
  skip_on_cran()
  local_mocked_bindings(core_unloaded = function() character(0))
  expect_silent(res <- sportsdataverse_attach())
  expect_null(res)
})

test_that("sportsdataverse_attach() prints the banner and attaches the packages", {
  skip_on_cran()
  old <- options(sportsdataverse.quiet = NULL); on.exit(options(old), add = TRUE)
  attached <- character(0)
  local_mocked_bindings(
    core_unloaded = function() c("cli", "rlang", "crayon"),
    same_library = function(pkg) attached <<- c(attached, pkg)
  )
  msgs <- capture_messages(sportsdataverse_attach())
  expect_match(paste(msgs, collapse = ""), "Attaching packages")
  expect_match(paste(msgs, collapse = ""), "crayon")
  expect_identical(attached, c("cli", "rlang", "crayon"))
})

test_that("sportsdataverse.quiet suppresses the startup banner", {
  skip_on_cran()
  old <- options(sportsdataverse.quiet = TRUE); on.exit(options(old), add = TRUE)
  local_mocked_bindings(
    core_unloaded = function() "cli",
    same_library = function(pkg) invisible()
  )
  expect_silent(sportsdataverse_attach())
})

test_that("same_library() attaches from the library the package came from", {
  skip_on_cran()
  on.exit(if ("package:tools" %in% search()) detach("package:tools"), add = TRUE)
  same_library("tools")
  expect_true("package:tools" %in% search())
})

test_that("package_version() highlights the development component", {
  skip_on_cran()
  local_mocked_bindings(
    packageVersion = function(x) base::package_version("1.2.3.9000"),
    .package = "utils"
  )
  v <- package_version("anything")
  expect_identical(crayon::strip_style(v), "1.2.3.9000")
})

test_that(".onAttach() does nothing when every member is attached", {
  skip_on_cran()
  local_mocked_bindings(is_attached = function(x) rep(TRUE, length(x)))
  expect_null(sportsdataverse:::.onAttach())
})

test_that(".onAttach() attaches the missing members and says it's ready", {
  skip_on_cran()
  old <- options(sportsdataverse.quiet = NULL); on.exit(options(old), add = TRUE)
  called <- FALSE
  local_mocked_bindings(
    is_attached = function(x) rep(FALSE, length(x)),
    sportsdataverse_attach = function() called <<- TRUE
  )
  expect_message(sportsdataverse:::.onAttach(), "Ready to go!")
  expect_true(called)
})

test_that("is_attached() checks the search path", {
  skip_on_cran()
  expect_identical(is_attached(c("base", "not_a_package_xyz")), c(TRUE, FALSE))
})

test_that("sportsdataverse_deps() reports the member packages themselves", {
  skip_on_cran()
  skip_if_offline()
  deps <- sportsdataverse_deps(
    recursive = FALSE,
    repos = c(CRAN = "https://cloud.r-project.org")
  )
  expect_true(all(core %in% deps$package))
})

# A local CRAN-like repo, so sportsdataverse_deps() runs with no network.
write_local_repo <- function(root) {
  dir.create(root)
  url <- paste0("file:///", sub("^/", "", normalizePath(root, "/")))
  dir <- file.path(root, substring(contrib.url(url), nchar(url) + 2))
  dir.create(dir, recursive = TRUE)
  writeLines(c(
    "Package: cli", "Version: 0.0.1", "",
    "Package: rlang", "Version: 999.0.0", "Imports: utils, notinstalledxyz", "",
    "Package: notinstalledxyz", "Version: 1.0.0", ""
  ), file.path(dir, "PACKAGES"))
  url
}

test_that("sportsdataverse_deps() diffs local against repo versions offline", {
  skip_on_cran()
  root <- tempfile("repo")
  on.exit(unlink(root, recursive = TRUE), add = TRUE)
  repo <- write_local_repo(root)
  deps <- sportsdataverse_deps(
    recursive = TRUE,
    pkg_list = c("rlang", "cli", "not_in_repo_xyz"),
    repos = c(LOCAL = repo)
  )
  expect_s3_class(deps, "data.frame")
  expect_named(deps, c("package", "cran", "local", "behind"))
  # cli is a tooling package and base packages are dropped
  expect_setequal(deps$package, c("notinstalledxyz", "rlang"))
  row <- deps[deps$package == "notinstalledxyz", ]
  expect_identical(row$local, "0")
  expect_true(row$behind)
  expect_true(deps$behind[deps$package == "rlang"])
})

fake_deps <- function(behind) {
  data.frame(
    package = c("hoopR", "zzzextra"),
    cran = c("3.1.0", "2.0.0"),
    local = c("3.0.0", "2.0.0"),
    behind = c(behind, FALSE),
    stringsAsFactors = FALSE
  )
}

test_that("sportsdataverse_update() says when everything is current", {
  skip_on_cran()
  local_mocked_bindings(sportsdataverse_deps = function(...) fake_deps(FALSE))
  expect_message(res <- sportsdataverse_update(), "up-to-date")
  expect_null(res)
})

test_that("sportsdataverse_update() prints the install command", {
  skip_on_cran()
  seen <- NULL
  local_mocked_bindings(sportsdataverse_deps = function(recursive, repos) {
    seen <<- repos
    fake_deps(TRUE)
  })
  out <- capture.output(msgs <- capture_messages(
    sportsdataverse_update(repos = c(CRAN = "https://cloud.r-project.org"))
  ))
  text <- paste(c(out, msgs), collapse = "\n")
  expect_match(text, "out of date")
  expect_match(text, "hoopR")
  expect_match(text, 'install.packages("hoopR")', fixed = TRUE)
  expect_false("sportsdataverse" %in% names(seen))

  out <- capture.output(msgs <- capture_messages(
    sportsdataverse_update(repos = c(CRAN = "https://cloud.r-project.org"), devel = TRUE)
  ))
  text <- paste(c(out, msgs), collapse = "\n")
  expect_identical(seen[["sportsdataverse"]], "https://sportsdataverse.r-universe.dev")
  expect_match(text, "sportsdataverse.r-universe.dev", fixed = TRUE)
})

test_that("sportsdataverse_sitrep() reports R, RStudio and every package", {
  skip_on_cran()
  local_mocked_bindings(sportsdataverse_deps = function(...) fake_deps(TRUE))
  local_mocked_bindings(
    isAvailable = function(...) TRUE,
    getVersion = function(...) base::package_version("2026.1.0"),
    .package = "rstudioapi"
  )
  out <- paste(capture.output(sportsdataverse_sitrep()), collapse = "\n")
  expect_match(out, "RStudio: 2026.1.0", fixed = TRUE)
  expect_match(out, "Core packages")
  expect_match(out, "3.0.0 < 3.1.0", fixed = TRUE)
  expect_match(out, "zzzextra")
})

test_that("sportsdataverse_logo() prints the logo and returns it invisibly", {
  skip_on_cran()
  expect_output(logo <- sportsdataverse_logo(), "____")
  expect_s3_class(logo, "sportsdataverse_logo")
  expect_length(logo, 12)
  expect_output(print(logo), "|___/", fixed = TRUE)
})

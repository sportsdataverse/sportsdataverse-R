# CLAUDE.md — sportsdataverse (R)

The `sportsdataverse` R package is an **umbrella meta-package** (tidyverse-style):
it installs, attaches, and re-exports the family of SportsDataverse R packages in
one step. It ships almost no data logic of its own — its job is the attach banner,
the package roster, and the install/update helpers.

- Targets **CRAN** (not yet accepted — 0.3.0 is the first submission), MIT licensed. Version 0.3.0. `Depends: R (>= 4.1.0)`.
- Docs: <https://sportsdataverse.org> · pkgdown site <https://r.sportsdataverse.org>.
- Maintainer: Saiem Gilani.

## Member packages (the `core` roster)

The `core` vector in `R/core.R` (returned by `get_core_functions()`) lists the
**9 attached member packages** — these are the canonical roster, also declared in
`Imports`:

`baseballr` · `cfbfastR` · `cfbseedR` · `fastRhockey` · `hoopR` · `mlbplotR` · `oddsapiR` · `sportyR` · `wehoop`

`chessR`, `hockeyR`, `toRvik`, and `worldfootballR` are intentionally **removed /
commented out** (archived or dropped upstream) — do not re-add them. Tooling
`Imports` (`cli`, `crayon`, `magrittr`, `rlang`, `rstudioapi`) are NOT members and
are excluded from `sportsdataverse_packages()`. NEVER list a member package the
DESCRIPTION doesn't declare.

## Commands

R-package workflow (roxygen2 / devtools / pkgdown):

```r
devtools::document()      # regenerate NAMESPACE + man/ (roxygen2 8.1.0)
devtools::test()          # testthat edition 3
devtools::check()         # R CMD check (CRAN gate)
pkgdown::build_site()     # local site preview (deploy is CI-driven)
```

## Architecture (attach + roster mechanism)

- **`R/core.R`** — the `core` character vector (the 9 members); the exported
  `get_core_functions()` returns it. This is the single source of truth for the roster.
- **`R/zzz.R`** — `.onAttach()` fires `sportsdataverse_attach()` for any `core`
  package not already attached, then prints the "Ready to go!" rule. Honors
  `options(sportsdataverse.quiet = TRUE)` to suppress the banner.
- **`R/attach.R`** — `sportsdataverse_attach()` attaches each unloaded `core`
  package via `same_library()` (loads from the same lib path it was found in,
  tidyverse pattern) and renders the two-column cli/crayon version banner.
- **`R/conflicts.R`** — the tidyverse-style `sportsdataverse_conflicts()` conflict
  reporter is **entirely commented out** (the `.onAttach` conflict block is dead
  too). There is currently NO active conflict management; leave it commented
  unless deliberately reviving it (it depended on the dropped `purrr`).
- **`R/reports.R`** — `sportsdataverse_packages(include_self=)` derives the roster
  by parsing the DESCRIPTION `Imports` field at runtime and subtracting the 5
  tooling packages — so it stays in sync with DESCRIPTION automatically.
- **`R/update.R`** — `sportsdataverse_deps()` (CRAN/r-universe version diff table),
  `sportsdataverse_update(recursive, repos, devel=)` (prints the `install.packages()`
  command for out-of-date members; `devel=TRUE` points `repos` at
  <https://sportsdataverse.r-universe.dev> for prebuilt dev binaries), and
  `sportsdataverse_sitrep()` (R/RStudio + per-package version report). All rewritten
  in base R + `cli` (0.3.0 dropped `dplyr`/`purrr`/`tibble`).

Exported surface (`NAMESPACE`): `%>%`, `get_core_functions`, `sportsdataverse_deps`,
`sportsdataverse_logo`, `sportsdataverse_packages`, `sportsdataverse_sitrep`,
`sportsdataverse_update`.

## Conventions

- roxygen2 markdown (`Roxygen: list(markdown = TRUE)`); regenerate `NAMESPACE` +
  `man/` with `devtools::document()` — never hand-edit them.
- Keep the meta-package thin: no analysis/data code belongs here. A new member
  touches, in one change: `R/core.R`'s `core` vector; DESCRIPTION `Imports` (with a
  `>=` floor); an `@importFrom <pkg> <fn>` anchor in `R/sportsdataverse-package.R`
  (otherwise R CMD check NOTEs an unused import); `_pkgdown.yml`'s network menu;
  README.Rmd's "will load" list AND its badge section; and `NEWS.md`.
- Edit `README.Rmd` (not `README.md`); re-knit to regenerate `README.md`.
- Update `NEWS.md` for any roster/version change.

## Gotchas

- **Roster lives in two places** — the `core` vector (`R/core.R`) and the
  `Imports` floor (DESCRIPTION). `sportsdataverse_packages()` reads DESCRIPTION;
  the attach path reads `core`. A member added to one but not the other desyncs
  the banner from the install set. `test-reports.R` asserts
  `sportsdataverse_packages()` == `sort(core)`.
- **Member-package version coupling** — `Imports` pins `>=` floors to current CRAN
  releases (`baseballr >= 2.0.0`, `cfbfastR >= 3.0.0`, `cfbseedR >= 0.2.0`,
  `fastRhockey >= 1.0.0`, `hoopR >= 3.1.0`, `mlbplotR >= 1.2.0`, `oddsapiR >= 1.0.1`,
  `sportyR >= 2.2.3`, `wehoop >= 3.0.0`).
  Bumping a member's floor is a deliberate DESCRIPTION + NEWS edit.
- **CRAN availability constrains the roster** — every `core` member must be on CRAN
  (this is why archived packages were dropped). r-universe is dev-only, reached via
  `sportsdataverse_update(devel = TRUE)`, not the default install path.
- **`pak`, not `pacman`** — install docs use `pak` (a `Suggests`, `>= 0.5.0`).
- **roxygen2 8** — documented with roxygen2 8.1.0 (`Config/roxygen2/version`, which
  replaced `RoxygenNote`), the same as the other SportsDataverse R packages. An older
  roxygen2 would write `RoxygenNote` back and drop the author list from
  `man/sportsdataverse-package.Rd`; don't let that churn into a commit.
- **Not yet on CRAN** — 0.3.0 is the first submission; `cran-comments.md` says "This is
  a new submission" and expects the matching incoming-check NOTE.

## Testing & CI

- `tests/testthat/` — testthat edition 3, one file (`test-reports.R`, `skip_on_cran()`).
- `.github/workflows/R-CMD-check.yaml` — macOS + windows (release) and ubuntu (release,
  oldrel-1) via `r-lib/actions@v2` + `actions/checkout@v6` (Node 24); `contents: read`,
  per-ref concurrency; runs on push/PR to `main`/`master`/`development_branch` + weekly cron.
- `.github/workflows/pkgdown.yaml` — `ubuntu-latest` + public P3M binaries; `contents: write`
  (needed by `pkgdown::deploy_to_branch()`); runs on push to `main`/`master` only, so a
  pkgdown break first shows up after merge. Deps are `any::pkgdown` + `local::.` — member
  packages come from DESCRIPTION, do not re-list them there.

## Reference

- pkgdown: `_pkgdown.yml` (Bootstrap 5, flatly, light-switch) → <https://r.sportsdataverse.org>.
- Member-package sites: cfbfastR.sportsdataverse.org · cfbseedR.sportsdataverse.org · hoopR.sportsdataverse.org ·
  wehoop.sportsdataverse.org · fastRhockey.sportsdataverse.org · oddsapiR.sportsdataverse.org ·
  sportyR.sportsdataverse.org · baseballr (billpetti.github.io/baseballr) ·
  mlbplotR (camdenk.github.io/mlbplotR).

## Commit Convention

Conventional Commits (`feat:`/`fix:`/`docs:`/`chore:`). **Never add AI co-author
trailers** (no `Co-Authored-By` referencing Claude/Copilot/Cursor/GPT/Gemini) on
commits or PRs.

## Cheat sheet

There is a printable one-page reference for this package at
<https://sportsdataverse.org/cheatsheets/sportsdataverse-R.pdf>, one of [a set covering every SportsDataverse package](https://sportsdataverse.org/cheatsheets).
Keep it in mind when adding or renaming an exported function: the sheet is a
hand-built canvas, so a surface change means the sheet needs a revision too.

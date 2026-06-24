# CLAUDE.md — sportsdataverse (R)

The `sportsdataverse` R package is an **umbrella meta-package**
(tidyverse-style): it installs, attaches, and re-exports the family of
SportsDataverse R packages in one step. It ships almost no data logic of
its own — its job is the attach banner, the package roster, and the
install/update helpers.

- **CRAN-published**, MIT licensed. Version 0.3.0.
  `Depends: R (>= 4.1.0)`.
- Docs: <https://sportsdataverse.org> · pkgdown site
  <https://r.sportsdataverse.org>.
- Maintainer: Saiem Gilani.

## Member packages (the `core` roster)

The `core` vector in `R/core.R` (mirrored by
[`get_core_functions()`](https://r.sportsdataverse.org/reference/get_core_functions.md))
lists the **7 attached member packages** — these are the canonical
roster, also declared in `Imports`:

`baseballr` · `cfbfastR` · `fastRhockey` · `hoopR` · `oddsapiR` ·
`sportyR` · `wehoop`

`chessR`, `hockeyR`, `toRvik`, and `worldfootballR` are intentionally
**removed / commented out** (archived or dropped upstream) — do not
re-add them. Tooling `Imports` (`cli`, `crayon`, `magrittr`, `rlang`,
`rstudioapi`) are NOT members and are excluded from
[`sportsdataverse_packages()`](https://r.sportsdataverse.org/reference/sportsdataverse_packages.md).
NEVER list a member package the DESCRIPTION doesn’t declare.

## Commands

R-package workflow (roxygen2 / devtools / pkgdown):

``` r

devtools::document()      # regenerate NAMESPACE + man/ from roxygen (RoxygenNote 7.3.3)
devtools::test()          # testthat edition 3
devtools::check()         # R CMD check (CRAN gate)
pkgdown::build_site()     # local site preview (deploy is CI-driven)
```

## Architecture (attach + roster mechanism)

- **`R/core.R`** — the `core` character vector (the 7 members) +
  `get_repos()` /
  [`get_core_functions()`](https://r.sportsdataverse.org/reference/get_core_functions.md).
  This is the single source of truth for the roster.
- **`R/zzz.R`** — `.onAttach()` fires `sportsdataverse_attach()` for any
  `core` package not already attached, then prints the “Ready to go!”
  rule. Honors `options(sportsdataverse.quiet = TRUE)` to suppress the
  banner.
- **`R/attach.R`** — `sportsdataverse_attach()` attaches each unloaded
  `core` package via `same_library()` (loads from the same lib path it
  was found in, tidyverse pattern) and renders the two-column cli/crayon
  version banner.
- **`R/conflicts.R`** — the tidyverse-style
  `sportsdataverse_conflicts()` conflict reporter is **entirely
  commented out** (the `.onAttach` conflict block is dead too). There is
  currently NO active conflict management; leave it commented unless
  deliberately reviving it (it depended on the dropped `purrr`).
- **`R/reports.R`** — `sportsdataverse_packages(include_self=)` derives
  the roster by parsing the DESCRIPTION `Imports` field at runtime and
  subtracting the 5 tooling packages — so it stays in sync with
  DESCRIPTION automatically.
- **`R/update.R`** —
  [`sportsdataverse_deps()`](https://r.sportsdataverse.org/reference/sportsdataverse_deps.md)
  (CRAN/r-universe version diff table),
  `sportsdataverse_update(recursive, repos, devel=)` (prints the
  [`install.packages()`](https://rdrr.io/r/utils/install.packages.html)
  command for out-of-date members; `devel=TRUE` points `repos` at
  <https://sportsdataverse.r-universe.dev> for prebuilt dev binaries),
  and
  [`sportsdataverse_sitrep()`](https://r.sportsdataverse.org/reference/sportsdataverse_sitrep.md)
  (R/RStudio + per-package version report). All rewritten in base R +
  `cli` (0.3.0 dropped `dplyr`/`purrr`/`tibble`).

Exported surface (`NAMESPACE`): `%>%`, `get_core_functions`,
`sportsdataverse_deps`, `sportsdataverse_logo`,
`sportsdataverse_packages`, `sportsdataverse_sitrep`,
`sportsdataverse_update`.

## Conventions

- roxygen2 markdown (`Roxygen: list(markdown = TRUE)`); regenerate
  `NAMESPACE` + `man/` with `devtools::document()` — never hand-edit
  them.
- Keep the meta-package thin: no analysis/data code belongs here. New
  member packages are added to `R/core.R`’s `core` vector AND the
  DESCRIPTION `Imports` (with a `>=` floor) AND `_pkgdown.yml`’s network
  menu — keep all three in sync.
- Edit `README.Rmd` (not `README.md`); re-knit to regenerate
  `README.md`.
- Update `NEWS.md` for any roster/version change.

## Gotchas

- **Roster lives in two places** — the `core` vector (`R/core.R`) and
  the `Imports` floor (DESCRIPTION).
  [`sportsdataverse_packages()`](https://r.sportsdataverse.org/reference/sportsdataverse_packages.md)
  reads DESCRIPTION; the attach path reads `core`. A member added to one
  but not the other desyncs the banner from the install set.
  `test-reports.R` asserts
  [`sportsdataverse_packages()`](https://r.sportsdataverse.org/reference/sportsdataverse_packages.md)
  == `sort(core)`.
- **Member-package version coupling** — `Imports` pins `>=` floors to
  current CRAN releases (`baseballr >= 1.6.0`, `cfbfastR >= 2.0.0`,
  `fastRhockey >= 0.4.0`, `hoopR >= 3.0.0`, `oddsapiR >= 0.0.3`,
  `sportyR >= 2.2.3`, `wehoop >= 2.1.0`). Bumping a member’s floor is a
  deliberate DESCRIPTION + NEWS edit.
- **CRAN availability constrains the roster** — every `core` member must
  be on CRAN (this is why archived packages were dropped). r-universe is
  dev-only, reached via `sportsdataverse_update(devel = TRUE)`, not the
  default install path.
- **`pak`, not `pacman`** — install docs use `pak` (a `Suggests`,
  `>= 0.5.0`).

## Testing & CI

- `tests/testthat/` — testthat edition 3, one file (`test-reports.R`,
  `skip_on_cran()`).
- `.github/workflows/R-CMD-check.yaml` — windows + ubuntu (release,
  oldrel-1) via `r-lib/actions`; runs on push/PR to
  `main`/`master`/`development_branch` + weekly cron.
- `.github/workflows/pkgdown.yaml` — builds +
  [`pkgdown::deploy_to_branch()`](https://pkgdown.r-lib.org/reference/deploy_to_branch.html)
  on push to `main`/`master`.

## Reference

- pkgdown: `_pkgdown.yml` (Bootstrap 5, flatly, light-switch) →
  <https://r.sportsdataverse.org>.
- Member-package sites: cfbfastR.sportsdataverse.org ·
  hoopR.sportsdataverse.org · wehoop.sportsdataverse.org ·
  fastRhockey.sportsdataverse.org · oddsapiR.sportsdataverse.org ·
  sportyR.sportsdataverse.org · baseballr
  (billpetti.github.io/baseballr).

## Commit Convention

Conventional Commits (`feat:`/`fix:`/`docs:`/`chore:`). **Never add AI
co-author trailers** (no `Co-Authored-By` referencing
Claude/Copilot/Cursor/GPT/Gemini) on commits or PRs.

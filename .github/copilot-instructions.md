# GitHub Copilot Instructions -- sportsdataverse (R)

These instructions tell GitHub Copilot (and other AI coding assistants) how to
write code that fits the `sportsdataverse` R meta-package. They mirror the
fuller [`CLAUDE.md`](../CLAUDE.md) development guide -- when the two differ,
treat `CLAUDE.md` and the current tests as authoritative.

## Package summary

`sportsdataverse` is an **umbrella meta-package** in the tidyverse mould: it
installs, attaches and re-exports the family of SportsDataverse R packages in
one step. It ships almost no data logic of its own -- its job is the attach
banner, the package roster, and the install/update helpers.

CRAN-published, MIT, `Depends: R (>= 4.1.0)`. pkgdown site:
<https://r.sportsdataverse.org>.

**Keep the meta-package thin.** Analysis or data-access code does not belong
here; it belongs in the member package.

## The roster

`R/core.R`'s `core` vector lists the **7 attached member packages**, which are
also declared in `DESCRIPTION`'s `Imports`:

`baseballr` · `cfbfastR` · `fastRhockey` · `hoopR` · `oddsapiR` · `sportyR` · `wehoop`

- `chessR`, `hockeyR`, `toRvik` and `worldfootballR` are **intentionally removed
  or commented out** (archived or dropped upstream). Do not re-add them.
- Tooling `Imports` (`cli`, `crayon`, `magrittr`, `rlang`, `rstudioapi`) are NOT
  members and are excluded from `sportsdataverse_packages()`.
- **Never list a member package that `DESCRIPTION` does not declare.**

## The roster lives in two places -- the main gotcha

The attach path reads the `core` vector; `sportsdataverse_packages()` derives
the roster at runtime by parsing `DESCRIPTION`'s `Imports` and subtracting the
five tooling packages. A member added to one but not the other desyncs the
banner from the install set, and `tests/testthat/test-reports.R` asserts
`sportsdataverse_packages() == sort(core)`.

Adding a member means editing **three** places in the same change:

1. the `core` vector in `R/core.R`,
2. `DESCRIPTION`'s `Imports`, with a `>=` version floor,
3. `_pkgdown.yml`'s network menu.

## Architecture

| File | Role |
| --- | --- |
| `R/core.R` | The `core` vector plus `get_repos()` / `get_core_functions()`. Single source of truth for the roster. |
| `R/zzz.R` | `.onAttach()` calls `sportsdataverse_attach()`, then prints the banner. Honours `options(sportsdataverse.quiet = TRUE)`. |
| `R/attach.R` | Attaches each unloaded member via `same_library()` (same lib path it was found in -- the tidyverse pattern) and renders the cli/crayon version banner. |
| `R/reports.R` | `sportsdataverse_packages()`, derived from `DESCRIPTION` at runtime. |
| `R/update.R` | `sportsdataverse_deps()`, `sportsdataverse_update()`, `sportsdataverse_sitrep()`. |
| `R/conflicts.R` | **Entirely commented out.** See below. |

`R/conflicts.R`'s tidyverse-style conflict reporter and the matching `.onAttach`
block are dead code -- they depended on the dropped `purrr`. There is currently
no active conflict management. Leave it commented unless deliberately reviving
it; do not "fix" it by re-adding `purrr`.

Exported surface: `%>%`, `get_core_functions`, `sportsdataverse_deps`,
`sportsdataverse_logo`, `sportsdataverse_packages`, `sportsdataverse_sitrep`,
`sportsdataverse_update`.

## Mandatory conventions

- **Base R + `cli` only** in the helper code. 0.3.0 deliberately dropped
  `dplyr`, `purrr` and `tibble`; do not reintroduce them for convenience.
- roxygen2 markdown (`Roxygen: list(markdown = TRUE)`). **Never hand-edit
  `NAMESPACE` or `man/*.Rd`** -- regenerate with `devtools::document()`.
- **Never hand-edit `README.md`** -- edit `README.Rmd` and re-knit.
- Update `NEWS.md` for any roster or version change.

## Other gotchas

- **Version floors are deliberate.** `Imports` pins `>=` floors to current CRAN
  releases. Bumping one is an intentional `DESCRIPTION` + `NEWS.md` edit, not a
  drive-by.
- **CRAN availability constrains the roster.** Every `core` member must be on
  CRAN -- that is why archived packages were dropped. r-universe is dev-only,
  reached through `sportsdataverse_update(devel = TRUE)`, never the default
  install path.
- **`pak`, not `pacman`**, in install documentation (`Suggests`, `>= 0.5.0`).

## Testing

`devtools::test()` -- testthat edition 3, one file
(`tests/testthat/test-reports.R`, `skip_on_cran()`). Run `devtools::check()`
before opening a PR; CI runs windows + ubuntu (release, oldrel-1).

## Commits

- Use [Conventional Commits](https://www.conventionalcommits.org/)
  (`feat:`, `fix:`, `docs:`, `chore:`).
- **Never** add AI tools as commit co-authors. Omit any `Co-Authored-By`
  trailer that references an AI assistant.

## Cheat sheet

There is a printable one-page reference for this package at
<https://sportsdataverse.org/cheatsheets/sportsdataverse-R.pdf>, one of
[a set covering every SportsDataverse package](https://sportsdataverse.org/cheatsheets).
Keep it in mind when adding or renaming an exported function: the sheet is a
hand-built canvas, so a surface change means the sheet needs a revision too.

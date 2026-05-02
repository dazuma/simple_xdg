# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

`simple_xdg` is a Ruby gem implementing the [XDG Base Directory Spec v0.8](https://specifications.freedesktop.org/basedir/0.8/). The entire public API is the `SimpleXDG` class in `lib/simple_xdg.rb`. Targets Ruby >= 2.7.

## Commands

The repo uses [toys](https://dazuma.github.io/toys) as its task runner (see `.toys/`). `gem install toys` first.

- `toys ci` — full CI suite (bundle install, rubocop, tests, yardoc, gem build). Run before committing.
- `toys test` — minitest suite only.
- `toys test -n /pattern/` — run a single test by name regex (minitest `-n` flag).
- `toys test test/test_simple_xdg.rb` - run tests in a specific test file
- `toys rubocop` — style check.
- `toys yardoc` — build docs; configured to fail on warnings or undocumented public objects, so all new public methods need YARD comments.
- `toys build` — build the gem into `pkg/`.
- `toys clean` — clean generated files (preserves `.claude/` local state).

## Architecture notes

- **Single-file library**: all behavior lives in `lib/simple_xdg.rb`. `lib/simple_xdg/version.rb` only carries `VERSION`.
- **Env injection**: `SimpleXDG.new(env: ...)` accepts an env hash (defaults to `::ENV`). Tests rely on this — never read `ENV` directly inside the class.
- **Path validation**: `XDG_*_HOME` vars must be absolute paths or are ignored (falling back to defaults). `XDG_*_DIRS` are split on `File::PATH_SEPARATOR` and individual non-absolute entries are dropped, but a non-empty `XDG_*_DIRS` (even if all entries are invalid) suppresses the system defaults — see the "still uses ... if nonempty but all paths illegal" tests.
- **Windows behavior is intentional**: when not on a unix-like system (detected via `File.absolute_path?("/usr")`), `data_dirs`/`config_dirs` defaults are empty rather than the unix system paths. Tests parameterize on this via `root_dir`.
- **`runtime_dir` has no default**: the spec doesn't define one. `runtime_dir` returns `nil`; `runtime_dir!` raises `SimpleXDG::Error`. Don't invent a fallback.
- **Lookup semantics**: `lookup_data`/`lookup_config` walk `[home] + dirs` in priority order and return *all* matches (callers decide how to merge). `lookup_state`/`lookup_cache` only check the single home dir (no `XDG_STATE_DIRS`/`XDG_CACHE_DIRS` exists in the spec) but still return an array for API consistency. The `type:` arg accepts any `File::Stat#ftype` value (string or symbol), an array of them, or `:any`.
- **`ensure_*_subdir`** creates with mode `0o700` via `FileUtils.mkdir_p` and lets `Errno::EEXIST`/`Errno::ENOTDIR` propagate when a non-directory blocks the path.

## Test fixtures

`test-data/data1/` and `test-data/data2/` are real on-disk fixtures used by lookup tests. `data1/indirectory/` is a directory; `data2/indirectory` is a file — this asymmetry is what the type-filter tests depend on. Don't restructure these without updating the corresponding tests.

The `ensure_*_subdir` tests create and tear down `test-data/data2/temp1/` in an `after` block; if a test crashes mid-run you may need to `rm -rf test-data/data2/temp1` manually.

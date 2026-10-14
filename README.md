# SparkDown Homebrew tap

Homebrew cask for [SparkDown](https://sparkdown.dev/), a markdown editor for you and your coding agents.

**Apple Silicon only** (arm64, macOS 11 Big Sur or later). There is no Intel build.

## Install

```bash
brew install --cask sparkdown/tap/sparkdown
# or, equivalently
brew install sparkdown/tap/sparkdown
```

## First launch (not notarized)

SparkDown is ad-hoc signed but not notarized by Apple, so macOS may block the first launch. Either right-click `SparkDown.app` in `/Applications` and choose **Open**, or run:

```bash
xattr -dr com.apple.quarantine /Applications/SparkDown.app
```

## Upgrade

```bash
brew update
brew upgrade --cask sparkdown
```

SparkDown's built-in updater can also update the app; `brew` will catch up on the next `brew upgrade`.

## Uninstall

```bash
brew uninstall --cask sparkdown
# also remove settings, caches and saved state:
brew uninstall --zap --cask sparkdown
```

## Maintainers

The cask is bumped for each `v*` release of sparkdown/sparkdown with `scripts/bump-cask.sh <version>` in that repo (see `docs/homebrew.md` there). CI in this repo runs `brew style`, `brew audit` and a real install/uninstall on macOS.

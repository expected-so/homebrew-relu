# homebrew-relu

Homebrew tap for [Relu](https://github.com/expected-so/relu).

```sh
brew tap expected-so/relu
brew install --cask relu
```

Relu isn't notarized by Apple yet, so the cask clears the Gatekeeper quarantine
attribute on install (`xattr -dr com.apple.quarantine`) so the app opens
without extra steps.

This repo also hosts the release binaries (`.dmg`), published automatically
by the release workflow in the main [relu](https://github.com/expected-so/relu)
repo.

# SnailUlitka Homebrew Tap

This tap distributes Homebrew formulae for projects maintained by
[snailUlitka](https://github.com/snailUlitka).

## Available Formulae

- [Friction](https://github.com/snailUlitka/friction), a local-first
  workflow-friction tracker
- [Purra](https://github.com/snailUlitka/purra), a high-performance Unicode
  scalar-to-text replacement engine and CLI

## Install Friction

```sh
brew install snailulitka/tap/friction
```

## Install Purra

```sh
brew install snailulitka/tap/purra
```

Or tap the repository first:

```sh
brew tap snailulitka/tap
brew install friction purra
```

For a `brew bundle` `Brewfile`:

```ruby
tap "snailulitka/tap"
brew "friction"
brew "purra"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

# HomeBrew-FileFetch

Homebrew tap for [FileFetch](https://github.com/haywoodmarx/filefetch) — an MCP tool for Claude Code that queries local files using a small, fast model.

## Install

```bash
brew tap haywoodmarx/filefetch
brew install filefetch
claude mcp add --scope user FileFetch filefetch-core
```

Restart Claude Code.

## Uninstall

```bash
claude mcp remove FileFetch --scope user
brew uninstall filefetch
brew untap paul.haywood-marx/FileFetch
```

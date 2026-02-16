# cli-tools

Small command-line utilities for Codex workflows.

## Included

- `codex-session`: browse, label, and resume local Codex sessions.

## Usage

```bash
./codex-session
./codex-session --help
./codex-session --latest
./codex-session --id <session-id>
./codex-session 2026-02-16
./codex-session --delete --latest
./codex-session --delete --id <session-id>
./codex-session --latest --name "CLI tools"
./codex-session --latest --summary "Built tools for easier codex session navigation and resume"
./codex-session --id <session-id> --name "Deploy flow" --summary "Created repo configured SSH and pushed latest script updates"
```

The script reads session files from `~/.codex/sessions` by default and resumes via `codex resume`.
By default, resume runs from this vault path:
`/Users/evgeny/Library/CloudStorage/OneDrive-Personal/Documents/Рабочее/Obsidian-pro/Professional Vault`

To override:
- `CODEX_SESSION_VAULT_DIR=/path/to/vault codex-session`
- `CODEX_SESSION_DISABLE_VAULT=1 codex-session` (resume from current directory)

Session start logs are appended to:
`<vault>/Projects/AI/Codex/codex-session/Sessions.md`
with this format:
`<status> <date> <time> <name> <description>.`
where `+` means successful start and `X` means unsuccessful.
Date groups are stored as H1 headers (`# YYYY-MM-DD`) and newest logs stay on top.

Session context notes are stored per session in:
`<vault>/Projects/AI/Codex/codex-session/session-contexts/<session-id>.md`

Each resume appends this block:
- H1 timestamp (`# YYYY-MM-DD HH:MM:SS TZ`)
- `Session ID: ...`
- `## Summary`
- `## Session Context`

Session context index:
`<vault>/Projects/AI/Codex/codex-session/session-context-index.md`

When first needed, legacy file
`<vault>/Projects/AI/Codex/Session Context.md`
is moved automatically to the index location.

## Option Format

Each selectable entry is shown as:

`<date> <time>   <name> [description]`

Example:

`2026-02-16 01:13:45   CLI tools [Built tools for easier codex session navigation and resume]`

## Features

- `--latest`: resume the most recent session (`codex resume --last`), or target it for updates.
- `--id <session-id>`: target one session directly for resume/name/summary updates.
- `--help`: print this `README.md` in the terminal.
- `--name "TEXT"`: save a human-friendly label for a session.
- `--summary "TEXT"`: save a summary; if longer than 10 words, it is truncated to 10 before saving.
- `--delete`: delete a targeted session and remove its saved label/summary metadata.
- `FILTER`: plain-text filter across date/time, id, name, summary, and path.
- Resume is executed from the configured vault directory unless disabled with `CODEX_SESSION_DISABLE_VAULT=1`.
- Numeric menu supports:
  - `N` to resume session `N`
  - `N delete` to delete session `N` (with confirmation prompt)
  - `N name: <name>` to save a new name for session `N`
  - `N summary: <summary>` to save a new summary for session `N` (10-word cap)
  - After edit/delete actions, the menu stays open for the next action
  - `0` to exit

## Storage

- Session labels: `~/.local/state/codex-session/labels.tsv`
- Session summaries: `~/.local/state/codex-session/summaries.tsv`
- Session start log note: `Projects/AI/Codex/codex-session/Sessions.md` in the configured vault
- Session context index note: `Projects/AI/Codex/codex-session/session-context-index.md`
- Per-session context notes: `Projects/AI/Codex/codex-session/session-contexts/<session-id>.md`

## Vault Note Sync

In this local repo, these git hooks are configured:
- `.git/hooks/post-commit`
- `.git/hooks/pre-push`

Both run `scripts/sync-vault-readme.sh` to copy this file to:
`<vault>/Projects/AI/Codex/codex-session/readme.md`

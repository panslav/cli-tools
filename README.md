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

# cli-tools

Small command-line utilities for Codex workflows.

## Included

- `codex-session`: browse, label, and resume local Codex sessions.

## Usage

```bash
./codex-session
./codex-session --latest
./codex-session --id <session-id>
./codex-session 2026-02-16
./codex-session --latest --name "CLI tools"
./codex-session --latest --summary "Built tools for easier codex session navigation and resume"
./codex-session --id <session-id> --name "Deploy flow" --summary "Created repo configured SSH and pushed latest script updates"
```

The script reads session files from `~/.codex/sessions` by default and resumes via `codex resume`.

## Option Format

Each selectable entry is shown as:

`<date> <time>   <name> <session id>   [summary]`

Example:

`2026-02-16 01:13:45   CLI tools 019c63cb-c8ee-7823-83c4-355f4c6f33b9   [Built tools for easier codex session navigation and resume]`

## Features

- `--latest`: resume the most recent session (`codex resume --last`), or target it for updates.
- `--id <session-id>`: target one session directly for resume/name/summary updates.
- `--name "TEXT"`: save a human-friendly label for a session.
- `--summary "TEXT"`: save a summary; if longer than 10 words, it is truncated to 10 before saving.
- `FILTER`: plain-text filter across date/time, id, name, summary, and path.
- Numeric menu includes `0) Exit` to cancel without selecting a session.

## Storage

- Session labels: `~/.local/state/codex-session/labels.tsv`
- Session summaries: `~/.local/state/codex-session/summaries.tsv`

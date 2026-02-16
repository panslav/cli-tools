# cli-tools

Small command-line utilities for Codex workflows.

## Included

- `codex-session`: lists local Codex sessions as `YYYY-MM-DD HH:MM:SS` and resumes the selected session with `codex resume`.

## Usage

```bash
./codex-session
./codex-session --latest
./codex-session 2026-02-16
```

The script reads session files from `~/.codex/sessions` by default.

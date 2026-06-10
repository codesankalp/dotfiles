# Global Instructions

These apply to **every** project. Project-specific `CLAUDE.md` files override anything here.

## Session rules (always)

- **Start every response with `[codesankalp]`** as the first line. If it's ever missing, treat it as a signal that context is full or something is off — re-read the relevant files before continuing.
- **Read `AGENTS.md` / `agents.md` first** if one exists at the repo root or in the working directory — it carries repo-specific context. Also honor a project's own `CLAUDE.md`.

## Communication

- Be concise and direct. Lead with the answer, then supporting detail only if it helps.
- When the task is clear, act — don't narrate a plan or ask for permission on routine steps.
- No flattery or filler ("Great question", "You're absolutely right"). Skip the recap unless asked.
- When you make a non-obvious decision or assumption, state it in one line.
- If something is wrong, broken, or a bad idea, say so plainly with the reason.

## Coding conventions

- Match the surrounding code: its style, naming, structure, and comment density. Read neighboring files before writing.
- Prefer the project's existing libraries and patterns over introducing new dependencies. Check before adding one.
- Comment the *why*, not the *what*. Don't add comments that restate the code.
- Handle errors explicitly; don't swallow exceptions or leave bare `catch`/`except` blocks.
- Don't leave dead code, commented-out blocks, or debug prints behind.
- Keep changes scoped to the request — don't opportunistically refactor unrelated code.

## Testing

- Run the project's existing test/lint/build commands before considering a change done. Find them in the README, `package.json`, `Makefile`, CI config, etc.
- Add or update tests for behavior you change when the project already has a test suite.
- Report test results honestly — if something fails or was skipped, say so with the output.

## Workflow & git

- Branch before committing if on the default branch (`main`/`master`). Don't commit or push unless asked.
- Write focused commits with clear messages explaining *why*; group unrelated changes separately.
- For **GitLab** environment — use `glab` for MRs, pipelines, and issues. Default remote terminology is *Merge Request*, not *Pull Request*.
- For **GitHub** environment — use `gh` for PRs, actions, and issues. Default remote terminology is *Pull Request*, not *Merge Request*.
- Don't force-push shared branches or rewrite published history without confirming first.

## Environment & tools

- Platform: macOS, `zsh` shell.
- Prefer the dedicated file/search tools over raw shell where one fits.
- Use absolute paths in tool calls; avoid `cd` when a path argument works instead.


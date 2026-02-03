# Remove AI Code Slop

Analyze the diff against the main branch and remove all AI-generated "slop" or low-signal code.

### Guidelines:
- **Comments:** Strip verbose or redundant comments that explain *what* the code is doing. Retain only high-value comments that explain *why* (if consistent with the file's existing style).
- **Defensive Over-engineering:** Remove abnormal defensive checks or try/catch blocks that aren't idiomatic to the surrounding codebase or called by trusted/validated paths.
- **Type Safety:** Remove `any` casts or lazy type-bypassing introduced to "just make it work." Use proper types or fix the root issue.
- **Consistency:** Ensure variable naming, spacing, and structural patterns match the pre-existing code perfectly.
- **Minimalism:** If a human developer would have written it more concisely, refactor it to that form.

### Final Output:
Provide a 1-3 sentence summary of the changes made. No other preamble.

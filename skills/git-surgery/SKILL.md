---
name: git-surgery
description: Safe interactive Git history operations — split commits, squash, rebase, cherry-pick, revert — with mandatory dry-run safety gates before any rewrite
---

# Git Surgery

Perform git history operations safely. Every history rewrite must be
planned, dry-run first, and executed only after explicit user approval.

## Core rules

1. NEVER rewrite history without a dry run first.
2. NEVER use `git push --force` unless the user explicitly types the command themselves.
3. Always operate on a clean tree: `git status --porcelain` must be empty (or stash first).
4. Record the current HEAD before any operation: `git rev-parse HEAD` — note it for the user.
5. After any rewrite, verify: `git log --oneline -5` and `git status`.

## Common operations

### Split a commit
1. `git log --oneline -10` — identify the commit to split.
2. `git rebase -i <commit>^` and mark the commit as `edit` (or run `git reset --soft <commit>^`).
3. Stage changes in logical chunks: `git add -p <file>` or `git add <files>`.
4. Commit each chunk with a focused message: `git commit -m "..."`.
5. When done: `git rebase --continue` or `git status` to confirm clean.
6. Verify the final log reads cleanly.

### Undo an unpushed commit (soft reset)
- `git reset --soft HEAD~1` keeps changes staged; `git reset --mixed HEAD~1` keeps them unstaged. Confirm intent first: does the user want to keep the changes?

### Cherry-pick
1. `git log --oneline --all | head -20` to find the target commit.
2. `git cherry-pick <sha>` — expect conflicts; resolve with `git status` and `git add`, then `git cherry-pick --continue`.
3. To abort: `git cherry-pick --abort`.

### Revert (safe for pushed history)
- `git revert <sha>` creates an inverse commit — the ONLY safe way to undo pushed history.

### Squash last N commits
1. `git rebase -i HEAD~N` — set all but the first to `squash`.
2. Preserve the first commit message as the summary; keep the body informative.

## Conflict resolution protocol
1. `git status` to enumerate conflicts.
2. For each conflicted file: show both sides (`git diff --cc <file>` or open it).
3. Resolve deliberately — ask the user when semantics are ambiguous.
4. `git add` each resolved file, then finish the operation.

## Safety checklist (run before every rewrite)
- [ ] Working tree clean (or stashed)
- [ ] HEAD recorded
- [ ] Dry-run/plan shown to user
- [ ] User approved the exact commands
- [ ] No force-push unless user typed it themselves
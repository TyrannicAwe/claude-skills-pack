# Claude Code Skills Pack — README

3 production-grade Claude Code skills that make AI pair-programming safe on
real codebases. No fluff, no prompts — actual operational workflows.

## What's inside

| Skill | What it does | When you need it |
|---|---|---|
| **git-surgery** | Safe history operations: split commits, squash, rebase, cherry-pick, revert — with mandatory dry-run gates and a pre-rewrite safety checklist | Any time you'd otherwise trust an AI to rewrite git history |
| **api-debugger** | Systematic API failure diagnosis: reproduce with curl, classify into a 4xx/5xx/network taxonomy, isolate the failing layer, verify the fix | Integration work, "works on my machine" bugs, 500s that aren't your code |
| **test-doctor** | Test-failure triage: classify assertion/error/timeout/flaky, find the true root cause, fix it, prove it with regression coverage | Flaky suites, mysterious failures, CI reds |

## Why it's worth $39

- Skills are the official way to give Claude Code persistent expertise —
  every session loads them automatically.
- Each skill encodes hard-won operational discipline (dry-run gates,
  evidence-first debugging, never-disable-a-test) that AIs don't have by
  default and that cost real incidents to learn.
- MIT-licensed: use them inside your team, adapt them, ship them.
- Written by a working engineer, battle-tested against real debugging
  sessions, not generated prompt collections.

## Install

```bash
git clone <repo-url> && cd claude-skills-pack && bash install.sh
# or: bash install.sh ~/.claude/skills
```

Then restart Claude Code. Invoke with:

```
/git-surgery <what you want to do>
/api-debugger <failing call or error>
/test-doctor <failing test name>
```

## Requirements

- Claude Code (or any agent that loads ~/.claude/skills skills)
- Nothing else — no APIs, no dependencies

## Support

- MIT license. Issues/PRs welcome.
- 30-day money-back guarantee: if it doesn't make your sessions safer, email
  <your-email> for a refund.

## Change log

- v1.0 — initial release: git-surgery, api-debugger, test-doctor
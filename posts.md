# Ready-to-paste launch posts (Aug 16, 2026)

All links:
- Repo: https://github.com/TyrannicAwe/claude-skills-pack
- Landing: https://TyrannicAwe.github.io/claude-skills-pack/
- Install: `bash <(curl -s https://raw.githubusercontent.com/TyrannicAwe/claude-skills-pack/main/install.sh)`
- Buy: https://payhip.com/b/jNBWp

---

## X post (short version)

> I got tired of AI agents rewriting my git history and "fixing" failing tests by deleting them.
>
> So I encoded the discipline into 3 Claude Code skills:
> git-surgery · api-debugger · test-doctor
>
> Dry-run gates before any history rewrite. Evidence-first API debugging. Root-cause test triage.
>
> $29 launch (50 left) → $39. One-line install, MIT, 30-day refund.
>
> https://github.com/TyrannicAwe/claude-skills-pack

## X post (thread version, for screenshot-led launch)

> Thread: how I turned the lessons from 10+ agent disasters into a sellable Claude Code skills pack 🧵
>
> 1/ The incidents: an agent force-pushed over a co-worker's branch. One "fixed" a flaky test by deleting it — bug shipped. One blamed the app for a 500 that was a misconfigured proxy.
>
> 2/ AIs don't come with operational discipline. You have to encode it. That's exactly what a skill is: repeatable behavior loaded into every session.
>
> 3/ git-surgery — every history rewrite is dry-run first, HEAD is recorded, force-push requires the human to type it. Demo: [screenshot of dry-run gate]
>
> 4/ api-debugger — reproduce with curl → classify (4xx/5xx/network) → isolate the layer → verify. No more guessing.
>
> 5/ test-doctor — classify the failure mode, find the root cause, fix it, prove it with a regression test. Never delete a failing test without a reason.
>
> 6/ Free to inspect: all 3 SKILL.md files are open on GitHub. You're paying for the curation + one-line install + updates.
>
> 7/ $29 for the first 50, then $39. If it doesn't make your sessions safer, refund.
>
> https://github.com/TyrannicAwe/claude-skills-pack

## Reddit r/ClaudeAI or r/ClaudeCode (resource framing, not an ad)

Title: I wrote 3 Claude Code skills that prevent AI agents from force-pushing, guessing at API bugs, and deleting failing tests — all open on GitHub

> After watching (and causing) enough agent incidents, I encoded the discipline into skills:
>
> - **git-surgery** — split/squash/rebase/cherry-pick with mandatory dry-run gates and a pre-rewrite checklist. The agent literally cannot force-push unless you type the command yourself.
> - **api-debugger** — reproduce with curl, classify into a 4xx/5xx/network taxonomy, isolate the failing layer, verify the fix. Stops "it's probably the backend" guessing.
> - **test-doctor** — classify assertion/error/timeout/flaky failures, find the root cause, fix, and prove with a regression test. Never silently disable a test.
>
> Full source is on GitHub (MIT) — you can read every SKILL.md before deciding anything. There's a paid pack with a one-line installer + updates, but the skills themselves are there to be inspected.
>
> Repo: https://github.com/TyrannicAwe/claude-skills-pack
> Install: `bash <(curl -s https://raw.githubusercontent.com/TyrannicAwe/claude-skills-pack/main/install.sh)`
>
> Feedback welcome — what discipline would you encode next? (I'm considering a code-review skill and a deployment-safety skill.)

## HN Show HN

Title: Show HN: Claude Code skills that stop agents from force-pushing, guessing at bugs, and deleting tests

> Skills are the official mechanism for giving Claude Code persistent behavior. I wrote three that encode the operational discipline agents lack by default:
>
> - git-surgery: dry-run-gated history rewrites
> - api-debugger: reproduce → classify → isolate → verify
> - test-doctor: failure-mode triage with root-cause fixes
>
> MIT, all source visible. One-line installer. $29 launch.
>
> Questions welcome: what incidents have your agents caused?

## Dev Discord post (for agent-tooling servers)

> Sharing something I built: 3 Claude Code skills for safer agentic coding — git-surgery (dry-run-gated rewrites), api-debugger (evidence-first debugging), test-doctor (root-cause test triage). MIT, source open. One-line install: `bash <(curl -s ...)`. Happy to take feedback before the paid version gets updates.

## Cold outreach (1:1, for the $49-79 tier later)
Target: dev leads at teams using Claude Code in production (search GitHub for repos with CLAUDE.md or .claude/skills dirs).
Message: "Saw you're using Claude Code with N engineers. We encoded git-history safety, API debugging, and test triage into skills with dry-run gates — [screenshot]. 20-min walkthrough?" — 5-20% conversion per 500k.io data.
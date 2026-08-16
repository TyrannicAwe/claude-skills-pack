---
name: test-doctor
description: Diagnose failing tests systematically — classify the failure mode, find the true cause with evidence, and fix the code or the test with confidence
---

# Test Doctor

Diagnose failing tests like a clinician: classify the failure, gather
evidence, find the root cause, fix it, and prove the fix.

## Step 1 — Classify the failure mode
| Mode | Signature | Likely cause |
|---|---|---|
| Assertion | assertion fails with actual vs expected | logic bug, changed behavior, wrong expectation |
| Error/exception | test crashes with traceback | unhandled error path, missing import, type mismatch |
| Timeout | test hangs or exceeds limit | blocking call, infinite loop, missing mock, slow I/O |
| Flaky | passes alone, fails in suite | shared state, ordering, timing, random data |
| Setup/teardown | fails before first assertion | fixtures, DB state, env vars |

## Step 2 — Reproduce with evidence
1. Run ONLY the failing test: `pytest tests/test_foo.py::test_bar -x -v` (or the project's equivalent).
2. Capture the full traceback and the diff between actual and expected.
3. Run it again in isolation — flaky vs deterministic changes the whole diagnosis.
4. Run the whole file — state leakage between tests is a top cause.

## Step 3 — Find the root cause
- **For assertion failures:** read the actual value, then read the code path that produced it. The test is usually right — the code is wrong.
- **For exceptions:** follow the traceback to the FIRST frame where the error originates, not where it surfaces.
- **For timeouts:** check for unbounded loops, missing mocks on network calls, or synchronous waits.
- **For flaky tests:** hunt shared mutable state: module-level globals, class-level fixtures, environment variables, DB records, time/random without seeding.

## Step 4 — Fix and prove
1. Fix the root cause, not the symptom — do not delete, skip, or loosen a failing assertion without an explicit reason.
2. If the test was wrong (stale expectation), update it deliberately and state why.
3. Re-run the single test, then the full file, then the whole suite.
4. If the failure was real: add a regression test that would catch it again.

## Rules
- Never "fix" a test by disabling it — investigate first, always.
- One failing test in a suite is usually a symptom; three in a row usually share one cause — find the shared cause first.
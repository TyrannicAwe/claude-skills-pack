---
name: api-debugger
description: Systematic API debugging workflow — reproduce with curl, isolate the failing layer, classify the error, and find the root cause with evidence
---

# API Debugger

Debug failing API calls methodically. Never guess — reproduce first, isolate
the layer, then fix with evidence.

## Step 1 — Reproduce with a minimal curl
1. Replay the exact failing request with curl:
   `curl -i -X <METHOD> '<url>' -H 'Content-Type: application/json' -H 'Authorization: ...' -d '<body>'`
2. Capture: status code, response headers, response body, timing (`-w '\n%{time_total}'`).
3. If auth is sensitive, substitute a test token or read it from an env var — never echo secrets.

## Step 2 — Classify the error (use the taxonomy)
| Class | Status ranges | Typical causes |
|---|---|---|
| 4xx client | 400, 401, 403, 404, 409, 422 | wrong payload shape, bad/expired auth, wrong path, validation, state conflict |
| 5xx server | 500, 502, 503, 504 | app crash, upstream failure, gateway timeout, rate limit misconfigured |
| Network | no response, TLS, DNS, timeouts | wrong base URL, proxy, cert, firewall, IPv6 vs IPv4 |

## Step 3 — Isolate the failing layer
Test in this order, stopping when the layer works:
1. **Reachability:** `curl -i <base_url>/health` or any known-good endpoint.
2. **Auth:** replay with a freshly issued token; check expiry/issuer/scope.
3. **Payload:** validate the body against the documented schema (field names, types, required fields, null vs missing).
4. **Headers:** Content-Type, Accept, idempotency keys, required custom headers.
5. **Server:** reproduce twice — if flaky, check for rate limits (Retry-After header), upstream dependencies, logs.

## Step 4 — Verify the fix
- Re-run the exact same curl from Step 1 and diff the output.
- Confirm the status code changed and the response is semantically correct, not just non-error.

## Anti-guessing rules
- Never change code before reproducing with curl — the bug often lives outside the app.
- Never assume a 500 is the app's fault: check reverse proxy, load balancer, and upstream APIs first.
- If two calls differ only in payload, diff the payloads — the answer is usually in a renamed or missing field.
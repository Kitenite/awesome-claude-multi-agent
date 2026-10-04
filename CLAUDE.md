# CLAUDE.md

Guidance for Claude Code and other coding agents that maintain this repository. Human contributors should start with [CONTRIBUTING.md](CONTRIBUTING.md). This file adds the maintainer workflow and the editorial rules behind it.

## Project

An awesome list of resources for multi-agent systems in which Claude is one of the underlying models: coordination patterns, orchestration frameworks, shared memory and messaging, protocols, evaluation, security, research, and production accounts.

- Repository: <https://github.com/Yigtwxx/awesome-claude-multi-agent> (lowercase slug, do not rename).
- Default branch: `main`.
- README title: `# Awesome Claude Multi-Agent` (title case, do not change).
- License: CC0-1.0.

The deliverable is curated Markdown and editorial judgment. There is no application code; the only code is the CI configuration and two shell scripts.

## Repository layout

| Path | Purpose |
| --- | --- |
| `README.md` | The list. The only file linted by awesome-lint. |
| `pitfalls.md` | Counter-arguments and documented failure modes. Same entry rules as the README. |
| `security-references.md` | Research on attacks against multi-agent systems and defenses. Same entry rules as the README. |
| `glossary.md` | Definitions of terms used across the list. |
| `CONTRIBUTING.md` | Scope, entry format, quality bar, and review process for contributors. |
| `CODE_OF_CONDUCT.md` | Contributor Covenant 2.1, unmodified apart from the contact address. |
| `SECURITY.md` | Policy for reporting compromised or malicious links. Not a reading list. |
| `LICENSE` | Canonical CC0-1.0 text, kept byte-exact so GitHub detects it. |
| `scripts/check-entry-format.sh` | Enforces entry shape, word limit, and banned vocabulary. |
| `scripts/check-staleness.sh` | Flags archived, renamed, unreachable, or inactive GitHub repositories. |
| `.github/staleness-allowlist.txt` | Paper reference implementations exempt from the activity check. |
| `.github/workflows/` | awesome-lint and entry format, markdownlint, lychee, and the monthly audit. |
| `.github/ISSUE_TEMPLATE/` | Issue forms for adding, removing, or fixing entries. |

`_workspace/` and `analiz.md` are local working notes. They are gitignored and must never be committed.

## Scope

In scope:

- Frameworks, runtimes, and harnesses that coordinate several agents and support Claude.
- Coordination patterns, each with a defining paper or reference implementation.
- Anthropic primary sources on agent and multi-agent design.
- Peer-reviewed or arXiv research on multi-agent LLM systems that matters to people building with Claude.
- First-hand accounts of building or running multi-agent systems, including arguments against them.
- Claude Code features, skills, hooks, and MCP servers used to coordinate or connect agents.
- Shared memory, messaging, and persistent state across agents or sessions.
- Benchmarks, environments, observability, and security work aimed at agent teams.

Out of scope:

- Generic agent frameworks with no documented Claude support.
- Single-agent tools, prompts, and skills with no coordination dimension.
- Products that call Claude but never coordinate more than one agent.
- Marketing pages, paywalled tutorials, listicles, and archived or deprecated projects.

When an entry is borderline, leave it out. The value of the list is as much in what it excludes as in what it includes.

## Sections

Every section opens with a one or two sentence intro that states its scope and its ordering. Use these rules to triage submissions.

| Section | Admits | Order |
| --- | --- | --- |
| Foundational Reading | Anthropic primary sources on agent design and the seminal papers that define patterns used elsewhere in the list. | Chronological |
| Multi-Agent Patterns and Architectures | One entry per named coordination pattern, linked to its defining paper or reference implementation. | Alphabetical |
| Orchestration Frameworks | Maintained libraries, runtimes, and harnesses that coordinate several agents and support Claude. | Alphabetical |
| Subagent Collections | Curated sets of Claude Code subagents. At most 10 entries. | Alphabetical |
| Starter Templates and Examples | Runnable projects that assemble a multi-agent system with Claude from end to end. | Alphabetical |
| Skills, Hooks, and MCP for Coordination | Claude Code features, skills, hooks, and MCP tooling used to coordinate or connect agents. | Alphabetical |
| Memory, State, and Communication | Shared memory, message passing, and persistent state across agents or sessions. | Alphabetical |
| Standards and Protocols | Open specifications for agent communication and discovery, and surveys that compare them. | Alphabetical |
| Evaluation and Benchmarks | Scored benchmarks and eval suites for agent teams, or widely used to evaluate them. | Alphabetical |
| Datasets and Environments | Simulation environments and datasets for studying agent interaction. | Alphabetical |
| Observability and Debugging | Tracing, replay, and evaluation tooling that follows nested multi-agent runs. | Alphabetical |
| Security, Safety, and Trust | Threats, defenses, and safety findings specific to interacting agents. | Alphabetical |
| Research Papers | Recent, high-impact multi-agent papers not already in Foundational Reading. At most 25 entries. | Chronological |
| Case Studies and Production Postmortems | First-hand engineering accounts of building or running multi-agent systems, including counter-arguments. | Alphabetical |
| Talks, Courses, and Books | Recorded talks, structured courses, and published books on multi-agent LLM systems. | Alphabetical |
| Community | Active forums, chats, subreddits, and newsletters where practitioners discuss multi-agent systems. | Alphabetical |
| Related Lists | Adjacent awesome lists, each with an honest one-line scope. Kept out of Contents, as awesome-lint expects. | Alphabetical by `owner/repo` |

General prompt-injection research belongs in `security-references.md`. General critiques of multi-agent designs belong in `pitfalls.md`. Change the taxonomy only when a better structure is clear, and explain the change in the commit message.

## Awesome list requirements

These come from the [sindresorhus/awesome submission checklist](https://github.com/sindresorhus/awesome/blob/main/pull_request_template.md) and are not negotiable:

- The first paragraph describes the topic, not the list. Do not start it with "A curated list of" or similar.
- The Awesome badge sits to the right of the H1 and links to `https://awesome.re`.
- `## Contents` is the first section. It lists every section except Related Lists, with no nesting.
- No Contributing, License, or Footnotes sections inside the Contents, no CI badges, and no "Inspired by" line.
- No archived, deprecated, or unmaintained projects.
- The list must not read as AI-generated, and the submission pull request to sindresorhus/awesome must be made by a person.
- `npx awesome-lint` passes with zero errors.

## Entry rules

- Format: `- [Name](url) - Description.`
- The description starts with a capital letter or digit, ends with a period, is objective, and has at most 20 words.
- It does not repeat the name, use the first person, or copy the project's own README wording.
- Papers and dated articles end with the venue or year in parentheses: `(ICML 2025)`, `(2026)`.
- Link to the canonical source. Use the arXiv abstract page for papers, the publisher page for books, and the `anthropic.com/<model>-system-card` landing URL for system cards, never the content-hashed PDF.
- Replace redirecting URLs with their final destination, and update renamed repositories.
- A project may appear in more than one section only when each entry links to a different artifact, such as a paper and its framework.

## Writing style

The README is read by practitioners who want facts. Write the way a careful engineer would describe a tool to a colleague.

- Use no marketing vocabulary: "powerful", "robust", "leverage", "comprehensive", "seamless", "game-changing", "the best", "cutting-edge".
- Avoid AI-sounding prose: "delve", "in the rapidly evolving landscape of", "it's worth noting", rule-of-three padding, and dramatic em-dashes. Descriptions contain no em-dashes at all.
- Use no emoji in headings or descriptions.
- State numbers and limits only when the source states them, and keep them current.

## Maintenance workflow

Use this flow for scheduled refreshes and for triaging contributions.

1. **Audit.** Run `GITHUB_TOKEN=$(gh auth token) sh scripts/check-staleness.sh README.md pitfalls.md security-references.md` and `lychee --config .github/lychee.toml './*.md'`. Fix renamed repositories and redirects, and drop archived or inactive entries.
2. **Research.** Look for gaps section by section. Prefer primary sources and maintained projects over coverage.
3. **Verify.** For every candidate, fetch the URL and confirm that the description is accurate, that the project has a multi-agent dimension and Claude support, and that it meets the activity and star thresholds (`gh api repos/<owner>/<repo>`). Check arXiv titles, IDs, and venues against the abstract page. If you cannot verify a candidate, drop it.
4. **Edit.** Keep the ordering rules, update section intros if their scope changes, and keep Contents in sync with the headings.
5. **Check.** Run every command under [Verification](#verification).
6. **Report.** Summarize entry counts per section, additions, removals and exclusions with reasons, open questions for the maintainer, and the output of each check.

Do not invent entries. If a section cannot be filled with good material, say so instead of padding it.

## Verification

All of these must pass before work is reported as done:

```sh
npx awesome-lint
sh scripts/check-entry-format.sh README.md pitfalls.md security-references.md
npx markdownlint-cli2 --config .github/.markdownlint-cli2.jsonc "**/*.md" "#node_modules"
lychee --config .github/lychee.toml './*.md'
GITHUB_TOKEN=$(gh auth token) sh scripts/check-staleness.sh README.md pitfalls.md security-references.md
```

Then read the README from top to bottom. Every entry should still earn its place, and nothing should sound hyped, vague, or machine-written.

## Git

- Do not commit, push, merge, or open pull requests unless the maintainer asks.
- Use [Conventional Commits](https://www.conventionalcommits.org/) with an imperative subject of at most 72 characters, for example `docs: add GovSim to Datasets and Environments`. The body explains why the change was made.
- Keep commits small and logical. When a change needs review before it is published, use a feature branch and a pull request.
- Never commit secrets, local notes (`_workspace/`, `analiz.md`), or editor files.

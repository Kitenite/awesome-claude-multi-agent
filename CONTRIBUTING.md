# Contributing

This list is selective, and most suggestions are declined. An entry earns its place by being useful to people who build systems where several agents work together and Claude is one of the models. Read this page before opening an issue or pull request.

## Scope

In scope are resources in which multiple agents coordinate through delegation, messaging, shared state, or independent verification, and in which Claude is a supported model. That covers subagents inside one Claude Code session as well as agents running in separate processes or on separate machines.

Out of scope:

- Single-agent tools, prompts, and skills with no coordination dimension.
- General agent frameworks with no documented Claude support.
- Products that call Claude but never coordinate more than one agent.

## Entry format

```text
- [Name](https://example.com) - Description.
```

- The description starts with a capital letter and ends with a period.
- It has at most 20 words, is objective, and is written in English.
- It describes the resource. It does not repeat the name, use the first person, or use marketing words such as "powerful", "robust", "leverage", or "comprehensive".
- Papers and dated articles end with the venue or year in parentheses, for example `(ICML 2025)` or `(2026)`.
- The link points to the canonical source: the repository, the arXiv abstract page, the publisher page, or the official documentation. Avoid redirects and tracking parameters.

[`scripts/check-entry-format.sh`](scripts/check-entry-format.sh) checks these rules in CI.

## Quality bar

An entry must meet all of the following:

- **Multi-agent.** It has a real coordination dimension, not only "an agent" or "uses Claude".
- **Distinctive.** It does not repeat what an existing entry already covers.
- **Verifiable.** The link resolves, the project is real, and the description matches what it does.
- **Alive.** It has meaningful activity in the last 12 months. Papers and primary sources are exempt.
- **Adopted.** It has 50 or more GitHub stars, unless it is unique and actively maintained.

## What gets declined

- Tutorials, listicles, and newsletter issues. Engineering posts are accepted when they are primary sources or describe a real deployment.
- Marketing and landing pages without technical depth.
- Archived, deprecated, or inactive projects.
- Paid software or courses whose description does not say they are paid.
- Duplicates, and resources that are better served by a list under Related Lists.
- Undisclosed self-promotion. Maintainers are welcome to submit their own projects if they say so.

## Ordering

Entries are sorted alphabetically within each section, ignoring case. Foundational Reading and Research Papers are sorted by publication date, oldest first.

## Companion documents

These files follow the same entry format and quality bar as the README:

- [pitfalls.md](pitfalls.md) - Counter-arguments and documented failure modes of multi-agent systems.
- [security-references.md](security-references.md) - Research on attacks against multi-agent systems and how to defend them.

[glossary.md](glossary.md) defines the terms used across the list.

## How to suggest an entry

1. Open an issue with the **Add entry** form, or a pull request that edits the right file.
2. Place the entry in the correct section and position.
3. Title the pull request `Add [Name]` or `Add [Name] to [Section]`.
4. Add one entry per pull request. Fixes to links or descriptions can be grouped.
5. Complete the checklist in the pull request template.

The maintainer aims to review pull requests within a week.

## How to report a problem

- Dead links, inactive projects, and inaccurate descriptions: open an issue with the **Remove or fix entry** form.
- A linked project that has been compromised or now serves malicious content: follow [SECURITY.md](SECURITY.md) and report it privately.

## Checks

Every pull request runs:

- [awesome-lint](https://github.com/sindresorhus/awesome-lint), the linter for awesome lists.
- `scripts/check-entry-format.sh`, which enforces the entry format above.
- [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) for Markdown style.
- [lychee](https://github.com/lycheeverse/lychee) for broken links.

A monthly workflow also checks links and repository activity, and opens an issue when an entry needs attention.

To run the same checks locally:

```sh
npx awesome-lint
sh scripts/check-entry-format.sh README.md pitfalls.md security-references.md
npx markdownlint-cli2 --config .github/.markdownlint-cli2.jsonc "**/*.md" "#node_modules"
lychee --config .github/lychee.toml './*.md'
GITHUB_TOKEN=$(gh auth token) sh scripts/check-staleness.sh README.md pitfalls.md security-references.md
```

## License

By contributing, you agree to dedicate your contribution to the public domain under [CC0 1.0](LICENSE).

## Code of conduct

Everyone taking part in this project is expected to follow the [Code of Conduct](CODE_OF_CONDUCT.md).

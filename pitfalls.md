# Pitfalls

Multi-agent systems add coordination overhead, split context across agents, and create failure modes that a single agent does not have. This document collects arguments against multi-agent designs and research on where they fail. Read it before choosing a multi-agent architecture, and make sure the case for one holds up against these sources.

Entries follow the same format and quality bar as the [README](README.md). See [CONTRIBUTING.md](CONTRIBUTING.md) to suggest one.

## Practitioner Counter-Arguments

- [Don't Build Multi-Agents](https://cognition.com/blog/dont-build-multi-agents) - Cognition's argument that context isolation failures make multi-agent systems unreliable for code editing tasks (2025).
- [Multi-Agents: What's Actually Working](https://cognition.com/blog/multi-agents-working) - Follow-up arguing writes must stay single-threaded; additional agents should contribute intelligence, not independent actions (2026).

## When Multiple Agents Underperform

- [Debate or Vote: Which Yields Better Decisions in Multi-Agent Large Language Models?](https://arxiv.org/abs/2508.17536) - Majority voting explains most multi-agent debate gains; debate alone does not raise expected correctness (NeurIPS 2025).
- [Do More Agents Help? Controlled and Protocol-Aligned Evaluation of LLM Agent Workflows](https://arxiv.org/abs/2606.05670) - Under one normalized protocol, five of six multi-agent workflows trail a matched single agent by 2.6 to 11.3 points (2026).
- [Multi-Agent Teams Hold Experts Back](https://arxiv.org/abs/2602.01011) - Self-organizing LLM teams underperform their own strongest member by up to 41% through integrative compromise (ICML 2026).
- [Rethinking the Bounds of LLM Reasoning: Are Multi-Agent Discussions the Key?](https://arxiv.org/abs/2402.18272) - A single agent with strong prompts nearly matches the best multi-agent discussion method (ACL 2024).
- [Should we be going MAD? A Look at Multi-Agent Debate Strategies for LLMs](https://arxiv.org/abs/2311.17371) - Multi-agent debate does not reliably beat self-consistency or ensembling and is sensitive to hyperparameters (ICML 2024).
- [Single-agent or Multi-agent Systems? Why Not Both?](https://arxiv.org/abs/2505.18286) - Gains of multi-agent over single-agent systems narrow significantly as the underlying models become more capable (2025).
- [Talk Isn't Always Cheap: Understanding Failure Modes in Multi-Agent Debate](https://arxiv.org/abs/2509.05396) - Debate can lower accuracy as agents abandon correct answers to agree with peers (2025).
- [Towards a Science of Scaling Agent Systems](https://arxiv.org/abs/2512.08296) - Across 260 configurations, coordination helps decomposable tasks but cuts sequential planning performance by up to 70% (2025).
- [When Single-Agent with Skills Replace Multi-Agent Systems and When They Fail](https://arxiv.org/abs/2601.04748) - Compiling multi-agent systems into one agent with skills cuts tokens, but skill selection collapses past a critical library size (2026).

## Failure Taxonomies and Open Problems

- [LLM Multi-Agent Systems: Challenges and Open Problems](https://arxiv.org/abs/2402.03578) - Systematizes unresolved issues: task allocation, reasoning through debate, layered context, and memory management (2024).
- [Patterns and Problems in Emerging Multiagent Systems](https://www.anthropic.com/research/multiagent-systems) - Anthropic red-team study of coordination failures, homogeneity collapse, and conflict escalation among interacting agents (2026).
- [Why Do Multi-Agent LLM Systems Fail?](https://arxiv.org/abs/2503.13657) - Taxonomy of 14 failure modes in three categories; system design issues are most common, ahead of inter-agent misalignment (NeurIPS 2025).

# Security References

Multi-agent systems widen the attack surface of a single agent. When agents call tools, read untrusted documents, and pass results to one another, one injected instruction can travel through the whole pipeline. This document collects research and guidance on that wider attack surface and on how to defend it.

Entries follow the same format and quality bar as the [README](README.md). To report a compromised or malicious link in this list, follow the [security policy](SECURITY.md) instead.

## Prompt Injection and Trust Boundaries

- [AgentDojo: A Dynamic Environment to Evaluate Prompt Injection Attacks and Defenses for LLM Agents](https://arxiv.org/abs/2406.13352) - Benchmark of 97 agent tasks and 629 security cases for testing injection attacks and defenses (NeurIPS 2024).
- [Defeating Prompt Injections by Design](https://arxiv.org/abs/2503.18813) - CaMeL separates control flow from data flow to give verifiable protection against prompt injection, evaluated on AgentDojo (2025).
- [Design Patterns for Securing LLM Agents against Prompt Injections](https://arxiv.org/abs/2506.08837) - Six design patterns that constrain agents for provable resistance to prompt injection, with case studies (2025).
- [Mitigate Jailbreaks and Prompt Injections](https://platform.claude.com/docs/en/test-and-evaluate/strengthen-guardrails/mitigate-jailbreaks) - Anthropic's official guidance on detecting and blocking prompt injection in Claude deployments.
- [Not What You've Signed Up For: Compromising Real-World LLM-Integrated Applications with Indirect Prompt Injection](https://arxiv.org/abs/2302.12173) - First systematic demonstration of indirect prompt injection against deployed LLM-integrated applications (AISec 2023).
- [Prompt Infection: LLM-to-LLM Prompt Injection within Multi-Agent Systems](https://arxiv.org/abs/2410.07283) - Shows malicious prompts can self-replicate across connected agents like a virus (2024).
- [Prompt Injection](https://simonwillison.net/series/prompt-injection/) - Simon Willison's ongoing series on prompt injection attacks and defenses, from the person who coined the term.

## MCP, A2A, and Orchestration Layer Security

- [Architecture Matters for Multi-Agent Security](https://arxiv.org/abs/2604.23459) - Across 13 multi-agent configurations, attack success varies up to 3.8x; most are more vulnerable than standalone agents (ICML 2026).
- [MCP Security Best Practices](https://modelcontextprotocol.io/docs/2026-07-28/tutorials/security/security_best_practices) - Official guidance for the 2026-07-28 revision covering confused deputy, SSRF, state-handle hijacking, and mix-up attacks.
- [MCP Security Notification: Tool Poisoning Attacks](https://invariantlabs.ai/blog/mcp-security-notification-tool-poisoning-attacks) - Hidden instructions in tool descriptions hijack agents, and one malicious MCP server can shadow a trusted server's tools (2025).
- [When AI Agents Go Rogue: Agent Session Smuggling Attack in A2A Systems](https://unit42.paloaltonetworks.com/agent-session-smuggling-in-agent2agent-systems/) - Unit 42 shows a malicious remote A2A agent injecting covert instructions across a stateful session (2025).
- [When Child Inherits: Modeling and Exploiting Subagent Spawn in Multi-Agent Networks](https://arxiv.org/abs/2605.08460) - Models how a compromised parent agent passes malicious state to spawned subagents through memory inheritance (2026).

## Threat Models and Risk Taxonomies

- [Multi-Agent Risks from Advanced AI](https://arxiv.org/abs/2502.14143) - Cooperative AI Foundation taxonomy of miscoordination, conflict, and collusion, with seven risk factors (2025).
- [Multi-Agentic System Threat Modeling Guide](https://genai.owasp.org/resource/multi-agentic-system-threat-modeling-guide-v1-0/) - OWASP guide applying its agentic AI threat taxonomy to systems where autonomous agents coordinate toward shared goals (2025).
- [OWASP Top 10 for Agentic Applications for 2026](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/) - Ten agent risks, including insecure inter-agent communication, cascading failures, and rogue agents (2025).

## Agent System Safety

- [How We Contain Claude Across Products](https://www.anthropic.com/engineering/how-we-contain-claude) - Anthropic's per-product sandboxes, including the risk of trusting subagent output more than raw tool results (2026).
- [Patterns and Problems in Emerging Multiagent Systems](https://www.anthropic.com/research/multiagent-systems) - Anthropic red-team study showing conformity, spontaneous collusion, and sabotage among Claude agents with conflicting goals (2026).
- [Trustworthy Agents in Practice](https://www.anthropic.com/research/trustworthy-agents) - Anthropic's five principles for safe agents: human control, value alignment, secure interactions, transparency, and privacy (2026).

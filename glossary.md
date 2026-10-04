# Glossary

Short, neutral definitions of terms used across this list. Terms are grouped by theme and ordered to read from top to bottom. For sources, see the [README](README.md), [pitfalls](pitfalls.md), and [security references](security-references.md).

## Coordination roles

- **Agent**: An LLM using tools in a loop to pursue a goal, with its own context and stopping condition.
- **Orchestrator (lead agent)**: The agent that decomposes a task, assigns subtasks, and synthesizes results.
- **Worker (subagent)**: An agent that handles a delegated subtask and reports back to the orchestrator.
- **Supervisor**: A routing agent that decides which specialized agent should handle each step.
- **Teammate**: In agent teams, a peer agent that runs independently and can message other teammates directly.
- **Critic**: An agent whose job is to review and propose revisions to another agent's output.

## Topologies and patterns

- **Orchestrator-worker**: One lead agent plans and spawns parallel workers, then merges their results.
- **Hierarchical**: Agents arranged in layers, where higher layers delegate to and supervise lower ones.
- **Network (decentralized)**: Agents communicate peer to peer without a fixed central coordinator.
- **Blackboard**: Agents read from and write to a shared workspace until a solution converges.
- **Pipeline (sequential)**: Output of one agent becomes the input of the next in a fixed order.
- **Handoff**: One agent transfers control and context to a more specialized agent mid-task.
- **Mixture-of-agents (MoA)**: Layered ensemble where each layer refines the previous layer's proposals.
- **Multi-agent debate**: Agents argue and critique each other across rounds to improve an answer.
- **Reflection**: An agent critiques its own output and revises it before finishing.
- **Plan-and-execute**: A planner produces a multi-step plan that an executor then carries out.
- **Recursive decomposition**: Subtasks are split into smaller subtasks until each is directly solvable.
- **Swarm**: Many lightweight agents coordinate through simple local rules or shared tasks.
- **Dynamic workflow**: A per-task orchestration script, generated on the fly, that fans out and merges subagents.
- **Writer-verifier**: One agent produces work while an independent agent checks it before acceptance.
- **Fan-out / fan-in**: Splitting work across parallel agents, then collecting and merging their results in one step.

## Communication and state

- **Message passing**: Agents exchange structured messages rather than sharing a single context window.
- **Shared memory**: A common store (vector, graph, or file) that multiple agents read and write.
- **Context window**: The token budget an agent can attend to at once; a core multi-agent constraint.
- **Context engineering**: Deciding what information enters each agent's context at each step.
- **Context isolation**: Giving each agent its own context window so subtasks do not pollute or overflow the orchestrator's context.
- **Knowledge graph**: A graph of entities and relations used as queryable long-term agent memory.
- **Mailbox**: A messaging channel that delivers inter-agent messages, used in agent teams.
- **Task list**: A shared, claimable set of work items that agents coordinate around.
- **Cross-session messaging**: Direct message exchange between independent agent sessions, possibly on different machines.

## Protocols and infrastructure

- **MCP (Model Context Protocol)**: Open standard for connecting agents to tools, data, and context.
- **A2A (Agent-to-Agent)**: Open standard for direct communication between agents across frameworks.
- **ANP (Agent Network Protocol)**: Protocol for decentralized agent discovery using decentralized identifiers.
- **Hook**: A lifecycle event handler that runs custom logic at defined points in an agent's loop.
- **Skill**: A packaged set of instructions and code an agent loads on demand for a specific task.
- **Tool**: A function or API an agent can call to act on the world or retrieve information.
- **Worktree isolation**: Running each coding agent in its own Git worktree so parallel edits stay separate until merged.

## Behavior and evaluation

- **Emergent behavior**: Group-level behavior that arises from agent interaction, not from any single agent.
- **Failure attribution**: Identifying which agent, at which step, caused a multi-agent run to fail.
- **Homogeneity collapse**: Agents that share one model converging on identical choices, which removes the diversity multiple agents should add.
- **Inter-agent misalignment**: Failure where agents act on conflicting assumptions about the shared task.
- **Ledger**: A running record of facts and progress an orchestrator maintains to steer a team.
- **Pass^k**: A reliability metric measuring whether an agent succeeds across k independent attempts.
- **Trace**: The recorded sequence of an agent run (prompts, tool calls, messages) used for debugging.

## Security

- **Prompt injection**: Untrusted input carrying instructions that an agent follows as if they came from its user or developer.
- **Agent-in-the-middle**: An attack that intercepts and alters messages between agents to compromise the whole system.
- **Confused deputy**: A privileged component tricked into using its authority on behalf of an unauthorized party.
- **Tool poisoning**: Hidden instructions placed in a tool's description or metadata that redirect any agent that loads the tool.

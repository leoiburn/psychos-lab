# Projects running on the lab

- **Amethyst web** — consultancy site with gateway failover (fireth → coldeth → laptop) driven by watchdogs + systemd timers; leads mirrored and deduped across all three nodes; hardened Python server against floods.
- **AI cyber range** — round-based purple-team duel: coldeth (Kali) attacks, fireth defends with an AI agent, laptop referees and hosts the LLM.
- **bizscout** — small agents on the Pis that scout small-business public info from OpenStreetMap.
- **sagent** — small-model local agent (qwen3:4b) with verifiers, RAG and MCP server, plus a RAM guard.
- **Dealer research agent** — long-running research agent on the 4-GPU node using RPC-split Qwen.
- **Automotrix sales bot** — Rust + Supabase dealership chatbot; RAG guardrails (audience/risk/disclaimer) enforced in SQL.
- **Cairos** — native Python/PySide6 desktop app for AI automations and agents, local Ollama.
- **mc-server** — portable modded Minecraft server (Docker/itzg) with backups and password auth, published through the VPS tunnel.
- **camvm** — Frigate NVR with CPU object detection + face recognition.

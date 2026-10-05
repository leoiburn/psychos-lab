# GPU Cluster (separate project)

Five Fedora 44 machines on a dedicated ethernet switch, run as one AI cluster. Separate from the homelab, but documented here.

| Node | GPU | Role |
|------|-----|------|
| node1 | RTX 5060 Ti | Head node: Ansible control, DHCP/NAT gateway for the cluster switch, `llama-server` (OpenAI-compatible API), Postgres + pgvector, SearXNG |
| node2 | RTX 5060 Ti | GPU worker (llama.cpp RPC) |
| node3 | RTX 5060 Ti | GPU worker (llama.cpp RPC) |
| node4 | RTX 5060 Ti | GPU worker, benched: GPU drops off the PCIe bus under load (hardware fault being diagnosed) |
| node5 | RTX 5060 Ti | GPU worker + hosts `camvm`, the AI security camera VM |

## How it works
- **Network**: isolated cluster subnet; node1 hands out DHCP with fixed leases and NATs out. Nothing on the cluster is exposed directly to the internet.
- **Provisioning**: one Ansible playbook installs NVIDIA drivers, CUDA, nvidia-container-toolkit, Podman and time sync on every node.
- **Distributed LLM**: llama.cpp splits one model across all GPUs over RPC (custom-built image, because the upstream CUDA image ships without the RPC server). Router mode swaps models on request (Qwen3 Coder 30B, Qwen3.6 35B MoE, Dolphin 24B).
- **Remote access**: outbound reverse SSH tunnel through a VPS with a key restricted to a single forwarded port. No inbound ports, no password auth.
- **Workloads**: coding agent "brain", a dealer research agent (crawler + RAG + embeddings).

## Lessons learned
- SELinux blocks systemd from exec'ing `ssh` directly; wrap it in `/bin/sh -c "exec ssh ..."`.
- Building llama.cpp with too many parallel jobs OOMs a 15 GB box; use `-j4`.
- PCIe AER error storms = check riser, seating and PCIe power before blaming software; `pcie_aspm=off` helps diagnose.

## node5 camera: Frigate + YOLO
See [cluster/frigate](../cluster/frigate/). A KVM VM on node5 gets a USB webcam via passthrough and runs Frigate in Podman: object detection, face recognition, and recording only around events (48 h retention). The UI is reachable only over the private VPN.

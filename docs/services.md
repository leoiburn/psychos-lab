# Services

## T320 — NAS
Proxmox host doubling as my NAS: central storage for my files, plus a Docker VM.
The Proxmox web UI and file shares are LAN-only, never forwarded.

## penthos (Intel NUC) — Parrot OS pentest box
- Pentests every other project in the lab (web gateway, Minecraft server, AI services) before and after changes
- Hosts **abliterated** (uncensored) local AI models for security research, offline

## knight (Dell OptiPlex) — Minecraft servers
Repo: [mc-server](https://github.com/leoiburn/mc-server)
- Modded Minecraft in Docker (itzg image) with automatic backups and a per-player password gate
- **Port forwarding**: only TCP 25565 forwarded from the router; RCON, SSH and Docker stay internal
- **Firewall**: ufw denies all inbound except Minecraft and rate-limited SSH
- **IP rate limiting**: per-IP cap on simultaneous and new connections to 25565, to stop floods and bot spam
- Also runs Ollama for local LLMs (localhost only)

## fireth (Orange Pi 4 Pro) — Visual AI
Repo: [visual-ai](https://github.com/leoiburn/visual-ai)
- Hosts YOLO object-detection models to learn visual AI on low-power hardware

## coldeth (Raspberry Pi 4) — Local agent + cybersecurity
Repo: [local-agent](https://github.com/leoiburn/local-agent)
- Runs small ~3B LLMs locally with Ollama
- Kali Linux toolbox for cybersecurity practice

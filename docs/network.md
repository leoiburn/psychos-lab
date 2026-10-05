# Network

**In simple words:** this shows how my computers are connected. The main rule: my home network has **no open doors** to the internet. People reach my stuff through a rented server that passes traffic in through a private, locked tunnel.

```
                Internet
                   │
               [ VPS ]  ← public IP only
                   │  reverse SSH tunnel (autossh/systemd)
                   ▼
   home router ── laptop ── direct ethernet ── knight (Ollama, Minecraft)
        │
     WiFi
        │
   coldeth (Pi 4) ── ethernet (NAT) ── T320 Proxmox ── VMs
        │
   fireth (Orange Pi)        penthos (NUC, Parrot OS)
```

## Design choices
- **No ports opened on the home router.** Public services come in through a reverse SSH tunnel to a cheap VPS (`GatewayPorts` + a locked-down tunnel-only user).
- **Proxmox UI is never exposed**; reached through an SSH tunnel.
- **Ollama binds to localhost** and is consumed via SSH tunnels, not exposed on the LAN.
- Hosts use DHCP; addresses drift, so everything is reached by hostname / SSH alias.

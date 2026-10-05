# Network

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
   fireth (Orange Pi)        node1 / node5 (Tailscale)
```

## Design choices
- **No ports opened on the home router.** Public services come in through a reverse SSH tunnel to a cheap VPS (`GatewayPorts` + a locked-down tunnel-only user).
- **Proxmox UI is never exposed**; reached through an SSH tunnel.
- **Ollama binds to localhost** and is consumed via SSH tunnels, not exposed on the LAN.
- **Tailscale** for remote nodes (camera VM, GPU box).
- Hosts use DHCP; addresses drift, so everything is reached by hostname / SSH alias.

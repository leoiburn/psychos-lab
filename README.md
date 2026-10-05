# psychos-lab 🧪

My **homelab**: a group of computers at home that I use to learn, build, and break things safely.

#linux #networking #backend #AI #VM #cybersecurity #SQL #Python

## What is a homelab?
A homelab is like a science lab, but for computers. Instead of paying for servers online, I use my own machines to practice running websites, game servers, AI, and security tools.

## My machines
| Name | What it is | What I use it for |
|------|-----------|-------------------|
| **T320** | Big Dell server | Stores my files (NAS) and runs virtual computers (Proxmox) |
| **penthos** | Small Intel NUC | Hacking practice (Parrot OS): I attack my own projects to find weak spots |
| **knight** | Dell OptiPlex | Minecraft servers and local AI |
| **fireth** | Orange Pi | Vision AI (YOLO) and website backup |
| **coldeth** | Raspberry Pi | Small AI models and security tools (Kali) |
| **VPS** | Rented server online | The "front door" that lets people reach my stuff without opening my home network |

## Learn more
- [Machines in detail](docs/hardware.md)
- [What each machine runs](docs/services.md)
- [How they connect (network)](docs/network.md)
- [Other projects](docs/projects.md)
- [GPU cluster (separate project)](docs/cluster.md) + [AI camera with YOLO](cluster/frigate/)

## Related repos
- [mc-server](https://github.com/leoiburn/mc-server): my Minecraft server, with a firewall and anti-spam limits
- [visual-ai](https://github.com/leoiburn/visual-ai): teaching an Orange Pi to see with YOLO
- [local-agent](https://github.com/leoiburn/local-agent): small AI and security tools on a Raspberry Pi
- [sales-project-demo](https://github.com/leoiburn/sales-project-demo): AI car salesperson chatbot

## Tools I use
Proxmox · Docker · Kali · Parrot OS · Ollama · YOLO · ufw/iptables · systemd · Python · Rust · Postgres

> 🔒 Passwords, IP addresses and usernames are kept **out** of this repo on purpose.

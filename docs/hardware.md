# Hardware / Nodes

| Node | Hardware | OS | Role |
|------|----------|----|------|
| coldeth | Raspberry Pi 4 | Kali Linux | Attacker box, WiFi→Ethernet router for the server rack, Bluetooth keyboard → USB-C HID bridge |
| fireth | Orange Pi 4 Pro | Linux (headless) | Defender box, primary web gateway |
| T320 | Dell PowerEdge T320 | Proxmox VE 9 | Hypervisor, Docker VM |
| knight | Dell OptiPlex 7060 | Linux | Local LLM (Ollama) + modded Minecraft server |
| node1 | Workstation, 4 GPUs | Fedora 44 | Distributed LLM inference (llama.cpp RPC) |
| node5 | Server | Proxmox | Hosts `camvm` (Frigate AI security camera) |
| VPS | Cloud VPS | Linux | Public entry point only (reverse tunnel) |
| laptop | Ubuntu laptop | Linux | Control plane, referee, last-resort gateway |

## Notes
- Pis are configured headless straight from the SD card; SSH key auth only.
- xrdp black screen on the Pi (XFCE) is fixed by disabling xfwm4 compositing.
- The Bluetooth→USB HID bridge lets a BT keyboard (iClever BK10) act as a wired USB keyboard for machines without BT (BIOS, installers).

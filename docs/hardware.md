# Hardware / Nodes

**In simple words:** this is the list of every computer in my lab and its job.

| Node | Hardware | OS | Role |
|------|----------|----|------|
| coldeth | Raspberry Pi 4 | Kali Linux | Small 3B AI models + cybersecurity, WiFi→Ethernet router for the server rack, Bluetooth keyboard → USB-C HID bridge |
| fireth | Orange Pi 4 Pro | Linux (headless) | YOLO vision models (visual AI), web gateway |
| T320 | Dell PowerEdge T320 | Proxmox VE 9 | Hypervisor, NAS (file storage), Docker VM |
| knight | Dell OptiPlex 7060 | Linux | Local LLM (Ollama) + modded Minecraft server |
| penthos | Intel NUC | Parrot OS | Pentesting box: attacks my own projects, hosts abliterated AI models |
| VPS | Cloud VPS | Linux | Public entry point only (reverse tunnel) |
| laptop | Ubuntu laptop | Linux | Control plane, referee, last-resort gateway |

## Notes
- Pis are configured headless straight from the SD card; SSH key auth only.
- xrdp black screen on the Pi (XFCE) is fixed by disabling xfwm4 compositing.
- The Bluetooth→USB HID bridge lets a BT keyboard (iClever BK10) act as a wired USB keyboard for machines without BT (BIOS, installers).

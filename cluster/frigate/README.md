# node5 camera: Frigate + YOLO

AI security camera on the cluster: USB webcam, then a KVM VM on node5, then Frigate (Podman).

## YOLO setup
1. Build the model: `./build-yolo.sh` (YOLOv9-tiny, 320px, ONNX).
2. Copy `yolov9-t-320.onnx` to Frigate's `config/model_cache/`.
3. Replace the detector block in `config.yml` with [`yolo-detector.yml`](yolo-detector.yml).
4. Restart Frigate and check inference speed in the System page.

Why YOLO: better accuracy than the default SSDLite at a similar speed on CPU, and the same model runs on the GPU later by changing `device: GPU`.

## Other features
- Tracks people, cars, pets and bikes; face recognition on
- Records only around detections, kept 48 h
- UI only reachable through a private VPN, viewer-only accounts for others

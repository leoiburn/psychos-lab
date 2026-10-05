#!/usr/bin/env bash
# Export YOLOv9 to ONNX for Frigate. Output lands in the current dir as yolov9-<size>-<img>.onnx.
# Then copy it into Frigate's config/model_cache/ and restart Frigate.
set -euo pipefail
MODEL_SIZE=${MODEL_SIZE:-t}   # t | s | m  (t = fastest, fine on CPU)
IMG_SIZE=${IMG_SIZE:-320}
podman build . --build-arg MODEL_SIZE="$MODEL_SIZE" --build-arg IMG_SIZE="$IMG_SIZE" --output . -f- <<'DOCKERFILE'
FROM python:3.11 AS build
RUN apt-get update && apt-get install --no-install-recommends -y libgl1 && rm -rf /var/lib/apt/lists/*
WORKDIR /yolov9
ADD https://github.com/WongKinYiu/yolov9.git .
RUN pip install --no-cache-dir -r requirements.txt onnx onnxruntime "onnx-simplifier>=0.4.1" onnxscript
ARG MODEL_SIZE
ARG IMG_SIZE
ADD https://github.com/WongKinYiu/yolov9/releases/download/v0.1/yolov9-${MODEL_SIZE}-converted.pt yolov9-${MODEL_SIZE}.pt
RUN sed -i "s/map_location='cpu')/map_location='cpu', weights_only=False)/g" models/experimental.py
RUN python3 export.py --weights ./yolov9-${MODEL_SIZE}.pt --imgsz ${IMG_SIZE} --simplify --include onnx
FROM scratch
ARG MODEL_SIZE
ARG IMG_SIZE
COPY --from=build /yolov9/yolov9-${MODEL_SIZE}.onnx /yolov9-${MODEL_SIZE}-${IMG_SIZE}.onnx
DOCKERFILE

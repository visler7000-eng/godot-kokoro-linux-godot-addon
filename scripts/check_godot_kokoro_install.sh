#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="${1:-$(pwd)}"
ADDON="$PROJECT_DIR/addons/godot_kokoro"

missing=0
for f in \
  "$ADDON/godot_kokoro.gdextension" \
  "$ADDON/kokoro_tts.gd" \
  "$ADDON/bin/libgodot_kokoro.linux.template_debug.x86_64.so" \
  "$ADDON/bin/libgodot_kokoro.linux.template_release.x86_64.so" \
  "$ADDON/bin/libsherpa-onnx-c-api.so" \
  "$ADDON/bin/libonnxruntime.so"; do
  if [[ ! -f "$f" ]]; then
    echo "Mangler: $f"
    missing=1
  fi
done

if [[ "$missing" == "1" ]]; then
  exit 1
fi

echo "Addon-filer OK."
if [[ -f "$PROJECT_DIR/project.godot" ]]; then
  godot --headless --path "$PROJECT_DIR" --quit
fi

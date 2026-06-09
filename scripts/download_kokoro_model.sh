#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODEL_DIR="$REPO_ROOT/addons/godot_kokoro/models"
TMP_DIR="${TMPDIR:-/tmp}/godot_kokoro_model_download_$$"
MODEL_URL="${MODEL_URL:-https://github.com/k2-fsa/sherpa-onnx/releases/download/tts-models/kokoro-multi-lang-v1_0.tar.bz2}"

mkdir -p "$MODEL_DIR" "$TMP_DIR"
cd "$TMP_DIR"

echo "Downloader model: $MODEL_URL"
curl -L --fail -o model.tar.bz2 "$MODEL_URL"
tar -xjf model.tar.bz2

find . -type f \( -name '*.onnx' -o -name 'voices.bin' -o -name 'tokens.txt' \) -print

ONNX_FILE="$(find . -type f -name '*.onnx' | head -n 1 || true)"
VOICES_FILE="$(find . -type f -name 'voices.bin' | head -n 1 || true)"
TOKENS_FILE="$(find . -type f -name 'tokens.txt' | head -n 1 || true)"

if [[ -z "$ONNX_FILE" || -z "$VOICES_FILE" || -z "$TOKENS_FILE" ]]; then
  echo "FEJL: Kunne ikke finde model.onnx/voices.bin/tokens.txt i pakken." >&2
  exit 1
fi

cp "$ONNX_FILE" "$MODEL_DIR/model.onnx"
cp "$VOICES_FILE" "$MODEL_DIR/voices.bin"
cp "$TOKENS_FILE" "$MODEL_DIR/tokens.txt"

rm -rf "$TMP_DIR"
echo "Model installeret i: $MODEL_DIR"

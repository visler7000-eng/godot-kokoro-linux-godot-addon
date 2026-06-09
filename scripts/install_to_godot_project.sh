#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 /path/to/Godot/project"
  exit 1
fi

PROJECT_DIR="$1"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ ! -f "$PROJECT_DIR/project.godot" ]]; then
  echo "FEJL: project.godot ikke fundet i: $PROJECT_DIR" >&2
  exit 1
fi

mkdir -p "$PROJECT_DIR/addons"
rsync -a --delete "$REPO_ROOT/addons/godot_kokoro" "$PROJECT_DIR/addons/"

echo "Installeret til: $PROJECT_DIR/addons/godot_kokoro"
echo "Tjek installation:"
echo "  godot --headless --path \"$PROJECT_DIR\" --quit"

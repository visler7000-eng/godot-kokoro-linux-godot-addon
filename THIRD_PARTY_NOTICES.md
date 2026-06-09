# Third-party notices

This package contains or references third-party software/model components.
Keep this file with all redistributed copies.

## Godot Kokoro TTS addon source

- Upstream package: Godot Kokoro TTS
- License stated in upstream README: MIT License
- Note: if the upstream repository later provides a full `LICENSE` file, include that exact file.

## Godot C++ bindings / godot-cpp

- Project: godotengine/godot-cpp
- License: MIT License
- Used to build the GDExtension shared library.

## sherpa-onnx

- Project: k2-fsa/sherpa-onnx
- License: Apache License 2.0
- Redistributed binary: `addons/godot_kokoro/bin/libsherpa-onnx-c-api.so`

## ONNX Runtime

- Project: microsoft/onnxruntime
- License: MIT License
- Redistributed binary: `addons/godot_kokoro/bin/libonnxruntime.so`

## Kokoro model files

- Upstream model: hexgrad/Kokoro-82M and/or compatible ONNX conversion
- License shown by upstream model cards: Apache License 2.0
- Default package does not include model files. Use `scripts/download_kokoro_model.sh` or document your chosen model source.

## Important redistribution note

If you include model files in a release, document the exact source, license, file names, and version/hash.

# Godot Kokoro TTS Linux addon

Linux x86_64 build of the Godot Kokoro TTS GDExtension for Godot 4.x.

This repository is intended as a clean redistribution/install package for Linux Godot projects. It includes the Linux `.so` files and installer/check scripts. Kokoro model files are not included by default.

## Included

```text
addons/godot_kokoro/
  godot_kokoro.gdextension
  kokoro_tts.gd
  bin/
    libgodot_kokoro.linux.template_debug.x86_64.so
    libgodot_kokoro.linux.template_release.x86_64.so
    libsherpa-onnx-c-api.so
    libonnxruntime.so
  models/
    README.md
scripts/
  install_to_godot_project.sh
  download_kokoro_model.sh
  check_godot_kokoro_install.sh
```

## Install into a Godot project

```bash
./scripts/install_to_godot_project.sh "/path/to/your/Godot/project"
```

Then download model files:

```bash
./scripts/download_kokoro_model.sh
```

Or place compatible model files manually here:

```text
addons/godot_kokoro/models/model.onnx
addons/godot_kokoro/models/voices.bin
addons/godot_kokoro/models/tokens.txt
```

Then validate:

```bash
godot --headless --path "/path/to/your/Godot/project" --quit
```

## Basic Godot usage

```gdscript
var tts := KokoroTTS.new()
add_child(tts)
if tts.initialize():
    var audio := tts.speak("Command interface online.")
    $AudioStreamPlayer.stream = audio
    $AudioStreamPlayer.play()
```

## Licenses

See `THIRD_PARTY_NOTICES.md` and `licenses/`.

# 🚀 Space Shooter

A 2D action platformer built in **Godot 4** — jump, dodge, and blast your way through waves of space enemies using mouse-aimed precision shooting.

**🎮 [Play in your browser on itch.io](https://timfabritius.itch.io/space-shooter)**

---

## About

**Space Shooter** is a school project developed at **Metropolia University of Applied Sciences** as part of the Godot Game Development Course. Built with Godot 4 and GDScript, it's a pixel-art 2D action platformer set in a space-themed world.

The web build is exported and committed directly to this repository, so the game can be hosted and played without any additional build steps.

---

## Features

- 2D action platformer with space theme
- Mouse-aimed precision shooting
- Wave-based enemies
- Pixel art visuals
- Playable in browser (HTML5 / WebAssembly)

---

## Controls

| Action | Key |
|---|---|
| Move | Arrow Keys or WASD |
| Jump | Space |
| Aim | Mouse |
| Shoot | Left Mouse Button |

---

## Getting Started

### Play Now

No installation needed — **[play directly in your browser](https://timfabritius.itch.io/space-shooter)** on itch.io.

### Run from Source

**Prerequisites:**
- [Godot 4](https://godotengine.org/download/) — check `project.godot` for the exact version

1. **Clone the repository**
   ```bash
   git clone https://github.com/tcfabritius/Space-Shooters.git
   ```

2. **Open in Godot**
   - Launch Godot 4
   - Click **Import** → select the cloned project folder → open `project.godot`

3. **Play**
   - Press **F5** or click the **Play** button in the editor

### Run the Web Build Locally

A prebuilt HTML5 export is included in the repo root. To run it locally you need a local server (browsers block WebAssembly from `file://`):

```bash
# Python 3
python -m http.server 8080
# then open http://localhost:8080 in your browser
```

---

## Project Structure

```
Space-Shooters/
├── Assets/                         # Sprites, audio, and other game assets
├── Scenes/                         # Godot scene files (.tscn)
├── Scripts/                        # GDScript source files (.gd)
├── builds/web/                     # Web build output directory
├── index.html                      # Web export entry point
├── index.js                        # Godot web engine loader
├── index.wasm                      # Compiled WebAssembly binary
├── index.pck                       # Packed game data
├── index.audio.worklet.js          # Web audio worklet
├── project.godot                   # Godot project configuration
├── export_presets.cfg              # Godot export settings
├── tulikärpänen.tscn               # Firefly scene
├── .gitignore
└── LICENSE                         # GPL-3.0
```

---

## Tech Stack

| Technology | Share | Usage |
|---|---|---|
| JavaScript | 54.8% | Web export runtime (Godot engine) |
| HTML | 29.5% | Web export shell |
| GDScript | 15.7% | Game logic & scripting |

> The high JavaScript/HTML ratio reflects the bundled Godot web runtime included in the repo, not hand-written JS.

---

## License

This project is licensed under the **GNU General Public License v3.0**. See the [LICENSE](LICENSE) file for details.

---

## Author

**Tim Fabritius** — [GitHub](https://github.com/tcfabritius) · [itch.io](https://timfabritius.itch.io)

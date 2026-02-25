# AGENTS.md

## Cursor Cloud specific instructions

### Project overview
Real-time webcam object detection web app. Vanilla HTML/CSS/JS frontend (`index.html`) served by a Python stdlib HTTP server (`server.py`). No build step, no package manager, no external Python dependencies.

### Running the dev server
```bash
python3 server.py
```
Serves on `http://localhost:8000` (auto-increments port if busy). The server opens a browser automatically via `webbrowser.open()`; in headless environments this can be ignored.

### AI backends
The app supports two AI backends (configured in-browser, not via env vars):
- **Llama.cpp** (local): requires a separate `llama-server` process on port 8080. Not available in Cloud Agent VMs by default.
- **OpenAI**: requires an API key entered in the UI. No server-side secret needed.

### Lint / test / build
There are no linters, automated tests, or build steps configured in this project. Validation is manual: start `server.py`, open the browser, and interact with the UI.

### Gotchas
- The repository had unresolved git merge conflicts in `index.html`, `README.md`, and `LICENSE`. These were resolved on the `cursor/development-environment-setup-d884` branch. If working on a branch where these are unresolved, the HTML will not render properly.
- `server.py` calls `webbrowser.open()` which may fail silently in headless environments — this does not affect serving.
- No webcam is available in Cloud Agent VMs, so the video feed area will be black and the "Démarrer" button will show a camera permission error. The rest of the UI remains fully interactive.

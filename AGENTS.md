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
- **Llama.cpp** (local): requires a separate `llama-server` process on port 8080.
- **OpenAI**: requires an API key entered in the UI. No server-side secret needed.

### Starting llama-server (SmolVLM)
llama.cpp must be built from source with OpenSSL support. The SmolVLM model requires a custom Jinja chat template that maps `image_url` to `image` type (the built-in template doesn't handle the OpenAI API format correctly).
```bash
# Build (one-time, ~90 seconds):
sudo apt-get install -y ninja-build libstdc++-13-dev libssl-dev
cd /tmp && git clone --depth 1 https://github.com/ggml-org/llama.cpp.git
cd llama.cpp && cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_CXX_COMPILER=g++ -DCMAKE_C_COMPILER=gcc -DLLAMA_OPENSSL=ON
cmake --build build --target llama-server -j$(nproc)

# Create the custom template (required for SmolVLM multimodal):
cat > /tmp/smolvlm_template.jinja << 'JINJA'
<|im_start|>{% for message in messages %}{{message['role'] | capitalize}}{% if message['content'] is string %}{{ ': ' + message['content'] }}{% else %}{% if message['content'][0]['type'] == 'image' or message['content'][0]['type'] == 'image_url' %}{{':'}}{% else %}{{': '}}{% endif %}{% for line in message['content'] %}{% if line['type'] == 'text' %}{{line['text']}}{% elif line['type'] == 'image' or line['type'] == 'image_url' %}{{ '<image>' }}{% endif %}{% endfor %}{% endif %}<end_of_utterance>
{% endfor %}{% if add_generation_prompt %}{{ 'Assistant:' }}{% endif %}
JINJA

# Start (auto-downloads model on first run, ~437 MB):
/tmp/llama.cpp/build/bin/llama-server \
  -hf ggml-org/SmolVLM-500M-Instruct-GGUF \
  --port 8080 -c 4096 --jinja \
  --chat-template-file /tmp/smolvlm_template.jinja &
```

### Lint / test / build
There are no linters, automated tests, or build steps configured in this project. Validation is manual: start `server.py`, open the browser, and interact with the UI.

### Gotchas
- The repository had unresolved git merge conflicts in `index.html`, `README.md`, and `LICENSE`. These were resolved on the `cursor/development-environment-setup-d884` branch. If working on a branch where these are unresolved, the HTML will not render properly.
- `server.py` calls `webbrowser.open()` which may fail silently in headless environments -- this does not affect serving.
- No webcam is available in Cloud Agent VMs. The app has an "Image" mode (file upload) as a fallback. It auto-detects webcam absence and switches to upload mode.
- SmolVLM's built-in Jinja template expects content type `image` but the OpenAI API format uses `image_url`. The custom template above handles both types. Without this fix you get "number of bitmaps does not match number of markers" errors.

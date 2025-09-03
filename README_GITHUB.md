# 🔍 Real-Time Webcam Object Detection

[![Deploy to GitHub Pages](https://github.com/subtilhugo/webcam-object-detection/actions/workflows/deploy.yml/badge.svg)](https://subtilhugo.github.io/webcam-object-detection/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Live Demo: [🌐 Try it now!](https://subtilhugo.github.io/webcam-object-detection/)**

A modern web interface for real-time object detection using your webcam with AI. Supports both OpenAI (cloud) and Llama.cpp (local) models.

## ✨ Features

- 🎥 **Real-time detection** via webcam
- 🤖 **Multi-model support**: OpenAI and Llama.cpp
- 🎨 **Modern responsive interface**
- ⚡ **Optimized performance** with interval management
- 🔧 **Flexible configuration** for different models
- 📱 **Mobile-friendly design**

## 🚀 Quick Start

### Option 1: Use Online Demo (Recommended)
1. **Click here**: [🌐 Live Demo](https://subtilhugo.github.io/webcam-object-detection/)
2. **Allow camera permissions**
3. **Enter your OpenAI API key** (get one at [OpenAI Platform](https://platform.openai.com/api-keys))
4. **Click "Start"** and enjoy!

### Option 2: Local Installation

```bash
# Clone the repository
git clone https://github.com/subtilhugo/webcam-object-detection.git
cd webcam-object-detection

# Quick start (web interface only)
./quick_start.sh

# Or complete installation with Llama.cpp
./setup_complete.sh
```

## 🎯 Usage

1. **Open the interface** (online or local)
2. **Choose your model**: OpenAI or Llama.cpp
3. **Configure settings**:
   - API key (for OpenAI)
   - Server URL (for Llama.cpp)
   - Custom instructions
   - Capture interval
4. **Click "Start"** and grant camera permissions
5. **Enjoy** real-time object detection!

## 🤖 Supported Models

### OpenAI (Cloud - Paid)
- **GPT-4o** (Recommended - very accurate)
- **GPT-4o Mini** (Fast, economical)
- **GPT-4 Vision** (Vision-specialized)

### Llama.cpp (Local - Free)
- **SmolVLM 500M** (Recommended - fast)
- **LLaVA 1.5 7B** (More accurate, slower)
- **BakLLaVA 1** (Good balance)

## 📋 Requirements

### For Online Demo:
- Modern web browser
- Camera access
- OpenAI API key

### For Local Installation:
- macOS (tested on macOS 14+)
- Homebrew
- At least 8GB RAM
- GPU recommended (Metal for macOS)

## 🔧 Configuration

### OpenAI Setup
1. Get API key from [OpenAI Platform](https://platform.openai.com/api-keys)
2. Enter it in the interface
3. Choose your preferred model

### Llama.cpp Setup
```bash
# Install Llama.cpp
./install_llama.sh

# Start the server
./start_llama_server.sh

# Open interface
python3 server.py
```

## 🎨 Interface Features

- **Language Selection**: English, French, or auto-detection
- **Predefined Instructions**: Quick buttons for common tasks
- **Real-time Status**: Live feedback on processing
- **Error Handling**: Clear error messages and troubleshooting
- **Responsive Design**: Works on desktop and mobile

## 📁 Project Structure

```
webcam-object-detection/
├── index.html              # Main web interface
├── server.py               # Python web server
├── install_llama.sh        # Llama.cpp installation script
├── start_llama_server.sh   # Llama.cpp server startup
├── setup_complete.sh       # Complete automated setup
├── quick_start.sh          # Quick web interface start
├── README.md               # Detailed documentation
├── GETTING_STARTED.md      # Quick start guide
└── LICENSE                 # MIT License
```

## 🆘 Troubleshooting

### Camera Issues
- Ensure camera permissions are granted
- Use HTTPS or localhost
- Check browser camera settings

### OpenAI Issues
- Verify API key is correct
- Check OpenAI account credits
- Ensure internet connection

### Llama.cpp Issues
- Verify server is running
- Check system requirements
- Review installation logs

## 🤝 Contributing

Contributions are welcome! Please feel free to:
- Report bugs
- Suggest improvements
- Add new models
- Enhance the interface

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [llama.cpp](https://github.com/ggml-org/llama.cpp) - For local infrastructure
- [SmolVLM](https://github.com/ggml-org/SmolVLM-500M-Instruct-GGUF) - For vision model
- [OpenAI](https://openai.com) - For cloud models
- [ngxson/smolvlm-realtime-webcam](https://github.com/ngxson/smolvlm-realtime-webcam) - For initial inspiration

---

**🎉 Ready to detect objects in real-time!**

[🌐 Try the live demo](https://subtilhugo.github.io/webcam-object-detection/) | [📖 Full Documentation](README.md) | [🚀 Quick Start](GETTING_STARTED.md)

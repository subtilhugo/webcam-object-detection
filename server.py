#!/usr/bin/env python3
"""
Serveur simple pour l'interface de détection d'objets par webcam
"""

import http.server
import socketserver
import os
import sys
import webbrowser
from pathlib import Path

class CORSHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

    def do_OPTIONS(self):
        self.send_response(200)
        self.end_headers()

def main():
    # Port par défaut
    PORT = 8000
    
    # Vérifier si le port est disponible, sinon essayer le suivant
    for port in range(8000, 8010):
        try:
            with socketserver.TCPServer(("", port), CORSHTTPRequestHandler) as httpd:
                print(f"🚀 Serveur démarré sur http://localhost:{port}")
                print(f"📁 Répertoire: {os.getcwd()}")
                print(f"🌐 Ouvrez votre navigateur sur: http://localhost:{port}")
                print("\n📋 Instructions:")
                print("1. Pour utiliser Llama.cpp:")
                print("   - Installez llama.cpp: https://github.com/ggml-org/llama.cpp")
                print("   - Lancez le serveur: llama-server -hf ggml-org/SmolVLM-500M-Instruct-GGUF -ngl 99")
                print("   - Utilisez l'URL: http://localhost:8080")
                print("\n2. Pour utiliser OpenAI:")
                print("   - Obtenez une clé API sur: https://platform.openai.com/api-keys")
                print("   - Entrez votre clé dans l'interface")
                print("\n3. Cliquez sur 'Démarrer' et accordez les permissions de caméra")
                print("\n⏹️  Appuyez sur Ctrl+C pour arrêter le serveur")
                
                # Ouvrir automatiquement le navigateur
                webbrowser.open(f'http://localhost:{port}')
                
                httpd.serve_forever()
        except OSError as e:
            if "Address already in use" in str(e):
                print(f"⚠️  Port {port} occupé, essai du port suivant...")
                continue
            else:
                raise e
        except KeyboardInterrupt:
            print("\n⏹️  Serveur arrêté.")
            break

if __name__ == "__main__":
    main()

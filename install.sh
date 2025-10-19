#!/bin/bash

# Script d'installation du Serveur MCP Droit Français
# Pour Linux / macOS

echo "🏛️ Installation du Serveur MCP Droit Français"
echo "=============================================="

# Vérifier Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 n'est pas installé. Veuillez l'installer d'abord."
    exit 1
fi

echo "✅ Python 3 détecté : $(python3 --version)"

# Créer l'environnement virtuel
echo "📦 Création de l'environnement virtuel..."
python3 -m venv .venv

# Activer l'environnement virtuel
echo "🔧 Activation de l'environnement virtuel..."
source .venv/bin/activate

# Installer les dépendances
echo "📚 Installation des dépendances..."
pip install --upgrade pip
pip install -r requirements.txt

# Vérifier l'installation
echo "🧪 Test du serveur MCP..."
python3 -c "from fastmcp import FastMCP; print('✅ FastMCP opérationnel')"

# Afficher les instructions de configuration
echo ""
echo "✅ Installation terminée !"
echo ""
echo "📋 Configuration Claude Desktop :"
echo "================================="
echo ""
echo "Fichier de configuration :"
echo "  - macOS: ~/Library/Application Support/Claude/claude_desktop_config.json"
echo "  - Linux: ~/.config/claude/claude_desktop_config.json"
echo ""
echo "Ajoutez cette configuration :"
echo ""
echo '{'
echo '  "mcpServers": {'
echo '    "droit-francais": {'
echo "      \"command\": \"$(pwd)/.venv/bin/python3\","
echo "      \"args\": [\"$(pwd)/droit_francais_MCP.py\"]"
echo '    }'
echo '  }'
echo '}'
echo ""
echo "📝 Note : Vérifiez que les fichiers .env existent avec vos clés API :"
echo "  - LEGIFRANCE_CLIENT_ID"
echo "  - LEGIFRANCE_CLIENT_SECRET"
echo "  - JUDILIBRE_API_KEY"
echo ""
echo "🔄 Redémarrez Claude Desktop pour activer le serveur MCP."
echo "🎯 Testez avec : 'Trouve-moi des articles sur le mariage dans le Code civil'"
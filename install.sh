#!/bin/bash

echo "Verificando dependências..."

# Instalar Zsh se não existir (focado em Debian/Ubuntu)
if ! command -v zsh &> /dev/null; then
    echo "Zsh não encontrado. Instalando..."
    sudo apt update && sudo apt install zsh -y
else
    echo "Zsh já está instalado."
fi

# 1. Instalar o Antigen
if [ ! -f "$HOME/antigen.zsh" ]; then
    echo "Baixando Antigen..."
    curl -L git.io/antigen > "$HOME/antigen.zsh"
fi

# 2. Clonar e configurar (seu código anterior...)
TEMP_DIR=$(mktemp -d)
git clone https://github.com/jeanmirandaws/antigen-and-powerlevel10k.git "$TEMP_DIR"
cp "$TEMP_DIR/.zshrc" "$HOME/.zshrc"
cp "$TEMP_DIR/.antigenrc" "$HOME/.antigenrc"
rm -rf "$TEMP_DIR"

echo "Setup concluído! Agora você pode digitar 'zsh'."

#!/bin/bash

echo "Iniciando a configuração do terminal..."

# 1. Instalar o Antigen
if [ ! -f "$HOME/antigen.zsh" ]; then
    echo "Baixando Antigen..."
    curl -L git.io/antigen > "$HOME/antigen.zsh"
fi

# 2. Clonar seu repositório de configurações (temporariamente)
TEMP_DIR=$(mktemp -d)
git clone https://github.com/jeanmirandaws/antigen-and-powerlevel10k.git "$TEMP_DIR"

# 3. Mover os arquivos para a Home
echo "Configurando .zshrc e .antigenrc..."
cp "$TEMP_DIR/.zshrc" "$HOME/.zshrc"
cp "$TEMP_DIR/.antigenrc" "$HOME/.antigenrc"

# 4. Limpeza
rm -rf "$TEMP_DIR"

echo "Setup concluído! Reinicie o terminal ou digite 'zsh'."

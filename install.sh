#!/bin/bash
echo "Instalando Meslo Nerd Font..."

# Criar o diretório de fontes se não existir
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# URLs das fontes recomendadas pelo autor do Powerlevel10k
fonts=(
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
)

for font_url in "${fonts[@]}"; do
    font_name=$(basename "$font_url" | sed 's/%20/ /g')
    if [ ! -f "$FONT_DIR/$font_name" ]; then
        echo "Baixando $font_name..."
        curl -L "$font_url" -o "$FONT_DIR/$font_name"
    fi
done

# Atualizar o cache de fontes do sistema
fc-cache -fv > /dev/null

echo "Fontes instaladas com sucesso!"



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

#!/bin/bash
set -e

echo "Configurando autocompletado nativo para my-custom-ollama..."

# Validar que el binario existe
if ! command -v ollama &> /dev/null; then
    echo "❌ Error: El comando 'ollama' no se encuentra en el PATH."
    exit 1
fi

# Instalar según el shell del usuario
if [ -n "$BASH_VERSION" ] || [ "$(basename -- "$SHELL")" = "bash" ]; then
    COMP_DIR="/usr/share/bash-completion/completions"
    sudo mkdir -p "$COMP_DIR"
    ollama completion bash | sudo tee "$COMP_DIR/ollama" > /dev/null
    echo "✅ Autocompletado de Bash instalado en $COMP_DIR"

elif [ -n "$ZSH_VERSION" ] || [ "$(basename -- "$SHELL")" = "zsh" ]; then
    COMP_DIR="/usr/local/share/zsh/site-functions"
    sudo mkdir -p "$COMP_DIR"
    ollama completion zsh | sudo tee "$COMP_DIR/_ollama" > /dev/null
    echo "✅ Autocompletado de Zsh instalado en $COMP_DIR"

else
    echo "⚠️ Shell no soportado automáticamente. Usa 'ollama completion -h'."
    exit 1
fi

echo ""
echo "🚀 ¡Instalación completada!"
echo "Para usar el autocompletado en esta misma terminal, ejecuta:"
echo "    exec \$SHELL"
echo "(O simplemente cierra esta ventana y abre una nueva)."
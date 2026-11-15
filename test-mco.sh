#!/bin/bash
set -e

echo "1. Deteniendo el servicio en ejecución..."
sudo systemctl stop ollama

echo "2. Compilando tu versión personalizada..."
cd ~/repos-lnx/my-custom-ollama
go build -v .

echo "3. Respaldando el binario original y reemplazándolo..."
if [ -f "/usr/local/bin/ollama" ] && [ ! -f "/usr/local/bin/ollama.bak" ]; then
    sudo mv /usr/local/bin/ollama /usr/local/bin/ollama.bak
    echo "   (Binario original guardado como ollama.bak)"
fi

sudo cp ollama /usr/local/bin/ollama
sudo chmod +x /usr/local/bin/ollama

echo "4. Iniciando el servicio con my-custom-ollama..."
sudo systemctl start ollama

echo "¡Despliegue completado con éxito!"

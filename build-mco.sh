#!/bin/sh
#!/bin/bash

PACKAGE="bash-completion"

if dpkg -s "$PACKAGE" >/dev/null 2>&1; then
    echo "El paquete '$PACKAGE' ya está instalado."
else
    echo "El paquete '$PACKAGE' no se encontró. Procediendo a instalar..."
    sudo apt update
    sudo apt install -y "$PACKAGE"
    echo "Instalación completada. Es necesario cerrar y volver a abrir esta terminal para aplicar los cambios."
fi

echo Building my-custom-ollama...
go build -v .


echo "Build complete."

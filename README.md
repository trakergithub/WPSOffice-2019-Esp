# 🚀 Script de Instalación y Configuración Completa de WPS Office para Linux

Este script de Bash, denominado `install.sh`, automatiza el proceso de instalación y configuración avanzada de una versión específica de **WPS Office (11.1.0.11723.XA)** para sistemas Linux basados en Debian/Ubuntu (arquitectura AMD64).

El objetivo principal es proporcionar una instalación funcional, multilingüe y libre de errores comunes, especialmente en lo referente a la exportación de PDF.

---

## ✨ Características Principales

* **Desinstalación Limpia:** Elimina cualquier rastro de instalaciones previas de WPS Office, incluyendo versiones DEB y Flatpak, y limpia directorios de configuración residuales (`/opt/kingsoft`, `~/.local/share/Kingsoft/`, etc.).
* **Instalación Base:** Instala la aplicación principal de WPS Office y las fuentes adicionales (`ttf-wps-fonts`) requeridas para la correcta visualización de símbolos.
* **Soporte Multilingüe Avanzado:**
    * Integra **Diccionarios de Corrección Ortográfica** en múltiples idiomas.
    * Añade la traducción completa de la **Interfaz de Usuario (MUI)**, con especial énfasis en el **idioma español**.
* **Corrección de Error de PDF:** Soluciona un error común de la librería `libtiff` que impide la correcta exportación y apertura de documentos PDF mediante la creación de un enlace simbólico necesario.
* **Optimización del Sistema:** Ejecuta `sudo apt autoclean` para liberar espacio tras el proceso de desinstalación inicial.

---

## ⚙️ Requisitos

Asegúrate de que los siguientes archivos y carpetas se encuentren en el **mismo directorio** que el script `install.sh`:

1.  `wps-office_11.1.0.11723.XA_amd64.deb` (Paquete binario de WPS Office).
2.  `ttf-wps-fonts_1.0_all.deb` (Paquete de fuentes complementarias).
3.  Carpeta `dicts/` (Contiene los diccionarios de corrección ortográfica).
4.  Carpeta `mui/` (Contiene los archivos de traducción de la interfaz de usuario).

---

## 💻 Modo de Uso

1.  Descarga o clona este repositorio en tu máquina Linux.
2.  Abre la terminal en la ubicación del script.
3.  Otorga permisos de ejecución al script:

    ```bash
    chmod +x install.sh
    ```

4.  Ejecuta el script (se solicitará tu contraseña de `sudo`):

    ```bash
    ./install.sh
    ```

> **⚠️ Nota:** El script realiza la instalación, configuración de diccionarios/traducciones y la corrección de PDF de forma automática. Al finalizar, iniciará la aplicación WPS Office (`wps &`) para confirmar la instalación.

---

## 🛠️ Solución del Error de PDF

La corrección para el problema de PDF para exportar documentos o abrirlos se implementa automáticamente mediante el siguiente comando:

```bash
sudo ln -s /usr/lib/x86_64-linux-gnu/libtiff.so.6 /usr/lib/x86_64-linux-gnu/libtiff.so.5

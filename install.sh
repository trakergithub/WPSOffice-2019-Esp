#!/bin/bash
#Desinstala cualquier versión anterior instalada y elimina directorios
sudo dpkg --purge --force-all wps-office 
sudo dpkg --purge --force-all libwps-0.4-4:amd64
sudo flatpak remove com.wps.Office
sudo rm /opt/kingsoft -rf
sudo rm /usr/share/fonts/wps-office -rf
sudo rm ~/.local/share/Kingsoft/ -rf
sudo rm /root/.local/share/Kingsoft/ -rf
sudo apt autoclean
clear

#Instala la ultima versión de WPS al 18/11/2025 (app,y fuentes)
sudo apt install wps-office.deb <<<'S'
sudo apt install ttf-wps-fonts_1.0_all.deb <<<'S'
rm ~/.local/share/Kingsoft/wps-office/office6/dicts/spellcheck -rf
rm ~/.local/share/Kingsoft/wps-office/office6/mui -rf
wps &
wait

#Copia las carpetas de diccionarios y de lenguaje a las carpetas de wps
cp -a dicts/ ~/.local/share/Kingsoft/wps-office/office6/dicts/spellcheck
cp -a mui/ ~/.local/share/Kingsoft/wps-office/office6/mui

#Corregir error de exportar y abrir PDF
sudo ln -s /usr/lib/x86_64-linux-gnu/libtiff.so.6 /usr/lib/x86_64-linux-gnu/libtiff.so.5

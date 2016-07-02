#!/bin/sh

# Limpando o arquivo temporário
cd /tmp
rm -rf *

# Baixando o restante necessário para o multilibs
# GConf,librsvg,libspectre e poppler
cd /home/backup
wget -c http://mirrors.slackware.com/slackware/14.2/slackware/l/GConf-3.2.6-i586-3.txz
wget -c http://mirrors.slackware.com/slackware/14.2/slackware/l/librsvg-2.40.16-i586-1.txz
wget -c http://mirrors.slackware.com/slackware/14.2/slackware/l/libspectre-0.2.7-i486-1.txz
wget -c http://mirrors.slackware.com/slackware/14.2/slackware/l/poppler-0.45.0-i586-1.txz

# Convertendo para compat32
convertpkg-compat32 -i GConf-3.2.6-i586-3.txz
convertpkg-compat32 -i librsvg-2.40.16-i586-1.txz
convertpkg-compat32 -i libspectre-0.2.7-i486-1.txz
convertpkg-compat32 -i poppler-0.45.0-i586-1.txz

# Instalando o restante do multilibs
upgradepkg --reinstall --install-new /tmp/*.t?z

# Movendo os novos arquivos compat32 para a pasta principal do multilibs
mkdir -p /home/backup/multilibs/slackware64-compat32/xx-compat32
mv /tmp/*.t?z /home/backup/multilibs/slackware64-compat32/xx-compat32
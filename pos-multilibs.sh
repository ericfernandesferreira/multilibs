#!/bin/sh

# Limpando o arquivo temporário
cd /tmp
rm -rf *

# Baixando o restante necessário para o multilibs
# GConf,librsvg,libspectre e poppler
cd /home/backup
wget -c http://mirrors.slackware.com/slackware/slackware-current/slackware/l/GConf-3.2.6-i586-3.txz
wget -c http://mirrors.slackware.com/slackware/slackware-current/slackware/l/librsvg-2.40.15-i586-2.txz
wget -c http://mirrors.slackware.com/slackware/slackware-current/slackware/l/libspectre-0.2.7-i486-1.txz
wget -c http://mirrors.slackware.com/slackware/slackware-current/slackware/l/poppler-0.44.0-i586-1.txz

# Convertendo para compat32
su -
. /etc/profile.d/32dev.sh
cd /home/backup
convertpkg-compat32 -i GConf-3.2.6-i586-3.txz
convertpkg-compat32 -i librsvg-2.40.15-i586-2.txz
convertpkg-compat32 -i libspectre-0.2.7-i486-1.txz
convertpkg-compat32 -i poppler-0.44.0-i586-1.txz

# Instalando o restante do multilibs
upgradepkg --reinstall --install-new /tmp/*.t?z
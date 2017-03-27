#!/bin/sh

GConf=GConf-3.2.6-i586-3.txz
librsvg=librsvg-2.40.16-i586-1.txz
libspectre=libspectre-0.2.7-i486-1.txz
poppler=poppler-0.50.0-i586-1.txz

# Baixando o restante necessário para o multilibs
# GConf,librsvg,libspectre e poppler
cd /home/backup/slackware
mkdir xx-compat32
cd xx-compat32
wget -c http://mirrors.slackware.com/slackware/slackware-current/slackware/l/$GConf
wget -c http://mirrors.slackware.com/slackware/slackware-current/slackware/l/$librsvg
wget -c http://mirrors.slackware.com/slackware/slackware-current/slackware/l/$libspectre
wget -c http://mirrors.slackware.com/slackware/slackware-current/slackware/l/$poppler

# Convertendo para compat32
convertpkg-compat32 -i $GConf
convertpkg-compat32 -i $librsvg
convertpkg-compat32 -i $libspectre
convertpkg-compat32 -i $poppler

# Movendo os novos arquivos compat32 para a pasta principal do multilibs
mkdir -p /home/backup/slackware/multilibs/slackware64-compat32/xx-compat32
mv /tmp/GConf-compat32-3.2.6-x86_64-3compat32.txz /home/backup/slackware/multilibs/slackware64-compat32/xx-compat32
mv /tmp/librsvg-compat32-2.40.16-x86_64-1compat32.txz /home/backup/slackware/multilibs/slackware64-compat32/xx-compat32
mv /tmp/libspectre-compat32-0.2.7-x86_64-1compat32.txz /home/backup/slackware/multilibs/slackware64-compat32/xx-compat32
mv /tmp/poppler-compat32-0.50.0-x86_64-1compat32.txz /home/backup/slackware/multilibs/slackware64-compat32/xx-compat32

# Instalando o restante do multilibs
cd /home/backup/slackware/multilibs/slackware64-compat32/xx-compat32
upgradepkg --reinstall --install-new *.t?z

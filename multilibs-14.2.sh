#!/bin/sh

# Baixando o multilibs 14.2
cd /home/backup/multilibs
lftp -c 'open http://www.slackware.com/~alien/multilib/ ; mirror -c -e 14.2'

# Removendo o desnecessário (XAP)
cd 14.2/slackware64-compat32
rm -rf xap-compat32
cd ..

# Instalando o multilibs (somente gcc)
upgradepkg --reinstall --install-new *.t?z
# upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z
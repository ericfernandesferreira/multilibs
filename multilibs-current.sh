#!/bin/sh

# Baixando o multilibs current
cd /home/backup
lftp -c 'open http://www.slackware.com/~alien/multilib/ ; mirror -c -e current'
mv current multilibs

# Removendo o desnecessário (XAP)
cd multilibs/slackware64-compat32
rm -rf xap-compat32
cd ..

# Instalando o multilibs (somente gcc)
upgradepkg --reinstall --install-new *.t?z
# upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z
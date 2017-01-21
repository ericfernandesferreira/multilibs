#!/bin/sh

# Baixando o multilibs 14.2
cd /home/backup/slackware
lftp -c 'open http://www.slackware.com/~alien/multilib/ ; mirror -c -e 14.2'
mv 14.2 multilibs

# Removendo o desnecessário (XAP)
cd multilibs/slackware64-compat32
rm -rf xap-compat32
cd ..

# Instalando o multilibs
upgradepkg --reinstall --install-new *.t?z
upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z

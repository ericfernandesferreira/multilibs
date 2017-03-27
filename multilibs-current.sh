#!/bin/sh

# Baixando o multilibs current
lftp -c 'open http://www.slackware.com/~alien/multilib/ ; mirror -c -e current'
cd ..
mv multilibs multi
cd multi
mv current /home/backup/slackware/multilibs

# Removendo o desnecessário (XAP)
cd /home/backup/slackware/multilibs/slackware64-compat32
rm -rf xap-compat32
cd ..

# Instalando o multilibs
upgradepkg --reinstall --install-new *.t?z
upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z

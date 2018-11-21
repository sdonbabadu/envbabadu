#!/bin/bash
echo running post install scripts for web..;
mkdir /var/storage/www/security
cd /var/storage/www/security
bash ../babadu.ru/vagrant/provision/genrsakeys.sh babadu
chmod 666 babadu-private.key
chmod 666 babadu-public.pem

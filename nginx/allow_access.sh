#!/usr/bin/bash
gpasswd -a www-data root
chmod g+x /root
chmod g+x /root/sites
chmod g+x /root/sites/baykusegitim.com
nginx -s reload
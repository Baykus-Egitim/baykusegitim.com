#!/usr/bin/bash
gpasswd -a www-data root
chmod g+x /root
chmod g+x /root/sites
chmod g+x /root/sites/huseyinyigit.com.tr
chmod g+x /root/html
chmod g+x /root/html/themes
chmod g+x /root/html/themes/startbootstrap-resume
nginx -s reload
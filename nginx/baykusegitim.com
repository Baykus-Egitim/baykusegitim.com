  
server {
    root /root/sites/baykusegitim.com;
    index index.html;
    server_name baykusegitim.com www.baykusegitim.com;
    location / {
            # First attempt to serve request as file, then
            # as directory, then fall back to displaying a 404.
            try_files $uri $uri/ =404;
    }


    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/baykusegitim.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/baykusegitim.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot


}
  
server {
    if ($host = www.baykusegitim.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = baykusegitim.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    server_name baykusegitim.com www.baykusegitim.com;
    listen 80;
    return 404; # managed by Certbot




}
  
server {
    root /root/sites/baykusegitim.com;
    index index.html;
    server_name baykusegitim.com www.baykusegitim.com;
    location / {
            # First attempt to serve request as file, then
            # as directory, then fall back to displaying a 404.
            try_files $uri $uri/ =404;
    }
}

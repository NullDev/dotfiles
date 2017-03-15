server {
        server_name syndicate.nulldev.org;

        # THIS WILL REDIRECT HTTP TO HTTPS
        return 301 https://syndicate.nulldev.org$request_uri;
        location ~ /.well-known {
               allow all;
        }
}

server {
        #listen 80 default_server;
        listen 443 ssl;
        # DISALLOW USING THE SITE AS iFRAME (CLICKJACKING)
        add_header X-Content-Type-Options nosniff;
        add_header X-Frame-Options "SAMEORIGIN";
        add_header X-XSS-Protection "1; mode=block";
        add_header X-Robots-Tag none;
        add_header X-Download-Options noopen;
        add_header X-Permitted-Cross-Domain-Policies none;

        # USE HSTS [A+]
        add_header Strict-Transport-Security 'max-age=31536000; preload';

        # COMMENT THAT OUT IF YOU DO NOT WANT TO INCLUDE SUBDOMAINS
        #includeSubDomains; preload';
        #listen [::]:80 default_server ipv6only=on;

        root /var/www/syndicate.nulldev.org/public_html;
        index index.html index.htm index.php;

        server_name syndicate.nulldev.org;
        ssl on;
        #ssl_buffer_size 1400;
        #ssl_session_tickets off;
        ssl_certificate /etc/letsencrypt/live/syndicate.nulldev.org/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/syndicate.nulldev.org/privkey.pem;

        # ANTI POODLE
        ssl_protocols TLSv1.2;

        # OCSP STAPLING
        ssl_stapling on;
        ssl_stapling_verify on;
        resolver 8.8.4.4 8.8.8.8 valid=300s;
        resolver_timeout 10s;

        ssl_session_cache shared:SSL:10m;
        ssl_session_timeout 24h;

        # THIS SHOULD COVER MOST BROWSER WITHOUT GETTING A BAD RATING
        ssl_ciphers 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-A$
        ssl_prefer_server_ciphers on;

        # WE WANT TO GENERATE A 4096-BIT DHPARAM KEY IN THE DIRECTORY '/etc/nginx/ssl' WITH
        # $ openssl dhparam -out dhparam.pem 4096
        ssl_dhparam /etc/nginx/ssl/dhparam.pem;

        # 2048-BIT CERTIFICATE
        location /.well-known/acme-challenge {
                root /var/www/letsencrypt;
        }
        
        location ~ /(config\.php|common\.php|cache|files|images/avatars/upload|includes|store) {
                deny all;
                return 403;
        }

        location / {
             #try_files $uri $uri/ =404;
             try_files $uri $uri/ /index.php$is_args$args;
        }

        location ~* \.(gif|jpe?g|png|css)$ {
                expires   30d;
        }

        location ~ \.php$ {
                 include snippets/fastcgi-php.conf;
                 fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        }

        location /wp-admin {
                auth_basic "Admin Login | NullDev";
                auth_basic_user_file /etc/nginx/auth/drawman01_pma_pass;
        }

        location = /favicon.ico { log_not_found off; access_log off; }
        location = /robots.txt { log_not_found off; access_log off; allow all; }
        location ~* \.(css|gif|ico|jpeg|jpg|js|png)$ {
                 expires max;
                 log_not_found off;
        }

        location ~ /\.ht {
                 deny all;
        }


        location ~ /\.ht {
                 deny all;
        }

        # LETSENCRYPT
        location ~ /.well-known {
               allow all;
        }


        #This uses the 404 Page located at /var/www/error/404.html
        error_page 404 /404.html;
            location = /404.html {
            root /var/www/error/;
            internal;
        }
}


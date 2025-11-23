#!/bin/bash
set -e

mkdir -p out

cat > ./out/nginx.conf <<'EOF'
worker_processes auto;

events {
    worker_connections 1024;
}

http {
    upstream galleons {
        server backend-1:80 max_fails=3 fail_timeout=10s;
        server backend-2:80 max_fails=3 fail_timeout=10s;
        server backend-3:80 max_fails=3 fail_timeout=10s;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://galleons;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
        }

        # Optional: health endpoint to satisfy checks
        location /healthz {
            return 200 'ok';
        }

        # Custom error pages
        error_page 502 /custom/502.html;
        error_page 503 /custom/503.html;
    }
}
EOF

echo "nginx.conf generated in ./out"

echo "Custom error pages generated in ./out/custom"
mkdir -p ./out/custom
echo "<h1>502 Bad Gateway</h1>" > ./out/custom/502.html
echo "<h1>503 Service Unavailable</h1>" > ./out/custom/503.html


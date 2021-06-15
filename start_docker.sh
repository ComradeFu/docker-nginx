docker stop nginx
docker rm nginx
docker run -d --net=host --name nginx --restart=always -p 80:80 \
-e TZ=`ls -la /etc/localtime | cut -d/ -f7-8` \
-v $PWD/www:/usr/share/nginx/html \
-v $PWD/nginx.conf:/etc/nginx/nginx.conf \
-v $PWD/sites-available:/etc/nginx/sites-available \
-v $PWD/sites-enabled:/etc/nginx/sites-enabled \
-v $PWD/nginxconfig.io:/etc/nginx/nginxconfig.io \
-v $PWD/ssl:/etc/nginx/ssl/ \
-v $PWD/logs:/var/log/nginx nginx

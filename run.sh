docker run -it \
-e DB_HOST=127.0.0.1 \
-e DB_DATABASE=bookstack \
-e DB_USERNAME=root \
-e DB_PASSWORD=123 \
-v /home/jose/Projects/docker-images/bookstack/uploads:/var/www/bookstack/public/uploads \
-v /home/jose/Projects/docker-images/bookstack/storage-uploads:/var/www/bookstack/public/storage \
-p 8080:80 \
--network=host \
--name test_bookstack \
solidnerd/bookstack:0.25.2

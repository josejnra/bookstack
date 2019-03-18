# Find docker host ip
# ip addr show docker0
# this may work 
DOCKER_HOST=$(ip addr show docker0 | grep -i inet | grep -i 16 | cut -d "/" -f 1 | cut -d ' ' -f 6)


# In mysql conf (/etc/mysql/mysql.conf.d/mysqld.cnf) bind address to host ip from docker0
# example
# bind-address    = 172.17.0.1

# verify user access rules in mysql-server for host options to access using the above host ip

docker run --rm -it \
-e DB_HOST=$DOCKER_HOST \
-e DB_DATABASE=bookstack \
-e DB_USERNAME=root \
-e DB_PASSWORD=123 \
-v /home/jose/Projects/docker-images/bookstack/uploads:/var/www/bookstack/public/uploads \
-v /home/jose/Projects/docker-images/bookstack/storage-uploads:/var/www/bookstack/public/storage \
-p 8080:80 \
--name bookstack-app \
solidnerd/bookstack:0.25.2

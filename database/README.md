docker run --name boilerplate-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql
sudo docker exec -ti boilerplate-mysql bash

sudo docker network create boilerplate-net
sudo docker network connect boilerplate-net boilerplate-mysql
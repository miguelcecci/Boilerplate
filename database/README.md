
docker run --name mysqldb -p 3306:3306 -v mysqldb:/var/lib/mysql -e MYSQL_ROOT_HOST=% -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7

docker run --name boilerplate-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql

sudo docker exec -ti boilerplate-mysql bash

sudo docker network create boilerplate-net
sudo docker network connect boilerplate-net boilerplate-mysql

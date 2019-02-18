docker build -t lumen-env .
docker run -p 8000:8000 -v $PWD/:/test
docker run -ti -p 8000:8000 -v $PWD:/test lumen-env bash
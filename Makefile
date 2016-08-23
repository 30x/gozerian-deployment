RESTY_VERSION=1.9.15.1


build-openresty: 
    docker build -t thirtyx/openresty:$(RESTY_VERSION) --build-arg RESTY_VERSION=$(RESTY_VERSION) openresty


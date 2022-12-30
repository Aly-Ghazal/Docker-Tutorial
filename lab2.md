# Lab 2 solutions

## Problem 1 answer

```
    FROM ubuntu
    RUN apt-get update
    RUN apt-get -y install nginx
    WORKDIR /var/www/html
    COPY index.html /var/www/html/
    ADD index.html.tgz /var/www/html/
    EXPOSE 80
    CMD ["nginx","-g", "daemon off;"]
```

then

```sudo docker run -d -p 8080:80 mynginx:1.0```

## problem 2 answer

- single stage

  ```
        FROM node:16-alpine 
        WORKDIR /app
        copy package*.json ./
        RUN npm install 
        copy . .
        EXPOSE 3000
        CMD [ "npm", "start" ]
  ```

- Multi stage
  
  ```
     FROM node:16-alpine as builder
     WORKDIR /app
     copy package*.json ./
     RUN npm install 
     copy . . 
     RUN npm run build

     FROM nginx:1.21.0-alpine
     COPY --from=builder /app/build /usr/share/nginx/html
     EXPOSE 80
     CMD ["nginx", "-g", "daemon off;"]
  ```

## problem 3 Answer

- ipvlan: IPvlan networks give users total control over both IPv4 and IPv6 addressing. The VLAN driver builds on top of that in giving operators complete control of layer 2 VLAN tagging and even IPvlan L3 routing for users interested in underlay network integration.

- macvlan: Macvlan networks allow you to assign a MAC address to a container, making it appear as a physical device on your network. The Docker daemon routes traffic to containers by their MAC addresses. Using the macvlan driver is sometimes the best choice when dealing with legacy applications that expect to be directly connected to the physical network, rather than routed through the Docker host’s network stack.

## problem 4 Answer

```
    sudo docker run -d --name web1  -p 8001:80 eboraas/apache-php
    sudo docker container exec -it web1
        apt-get update
        apt-get install iputils-ping
    sudo docker run -d --name web2 -p 8002:80 eboraas/apache-php
    sudo docker container exec -it web2
        apt-get update
        apt-get install iputils-ping
    docker network create myNetwork
    docker network connect myNetwork web1
    docker network connect myNetwork web2
    docker exec -ti web1 ping web2
    docker exec -ti web2 ping web1
```

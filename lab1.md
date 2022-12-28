# lab1 solutions

## Problem1 solution

- Run the container hello-world
    ```sudo docker run hello-world```
- Check the container status
  ``` sudo docker ps -a ```
- Start the stopped container
 ```sudo docker stop c72ff```
 then
 ```sudo docker start c72ff```
- Remove the container
  ```sudo docker rm b61191f```
- Remove the image
  ```sudo docker rmi -f d1165f```
  > -f for force because it was used by a stopped container

## problem2 solution

- Run container centos or ubuntu in an interactive mode
  ```sudo docker run -i ubuntu```
- Run the following command in the container “echo docker ”
  ```docker```
- Open a bash shell in the container and touch a file named hello-docker
  ```touch hello-docker``` then ```ls``` and it has been created
- Stop the container and remove it. Write your comment about the file hello-docker
    ```when I removed the container the file has been removed too (the entire container context)```
- Remove all stopped containers
  ```sudo docker rm $(sudo docker ps --filter status=exited -q)```

## problem 3 solution

- Run a container httpd with name apache and attach a volume to the container
  - Volume for containing static html file

```sudo docker run -it -v data:/usr/share/nginx/html -p 8090:80 --name APACHE nginx bash```
then in bash
```echo "<h1>Aly Ghazal</h1>" > /usr/share/nginx/html/index.html```
then
```service start nginx```

- Remove the container

```sudo docker rm ecec1c18879b```

- Run a new container with the following:
  - Attach the volume that was attached to the previous container
  - Map port 80 to port 9898 on you host machine
  - Access the html files from your browser
  
  ```sudo docker run -it -v data:/usr/share/nginx/html -p 9898:80 --name NEWcon nginx bash```
  then start service the enter localhost:9898 and it will show the same result

## problem 4 solution

- Run the image httpd again without attaching any volumes
  ```sudo docker run -it nginx bash```
- Add html static files to the container and make sure they are accessible
  
  ```
     $ cd /usr/share/nginx/html/
     $ touch header.html footer.html
     $ chmod 777 *
     ```
- Commit the container with image name my apache
  ```sudo docker commit ae62e1f54092 newimage```
- Create a dockerfile for ngnix and build the image from this dockerfile
  
  ```touch Dockerfile```
  in dockerfile
  ```From nginx```
  then
  ```sudo docker build .```

## problem 5 solution

- Create a volume called mysql_data, then deploy
  a MySQL database called app-database. Use the
  mysql latest image, and use the -e flag to
  set MYSQL_ROOT_PASSWORD to P4sSw0rd0!.
  Mount the mysql_data volume to /var/lib/mysql.
  The container should run in the background.
  ```sudo docker run -d -e MYSQL_ROOT_PASSWORD="P4sSw0rd0!" -v mysql_data:/var/lib/mysql --name app-database mysql```

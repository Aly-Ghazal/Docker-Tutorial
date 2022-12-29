# FROM ubuntu
# RUN apt-get update
# RUN apt-get -y install nginx
# COPY index.html /var/www/html/
# ADD index.html.tgz /var/www/html/
# EXPOSE 80
# CMD ["nginx","-g", "daemon off;"]

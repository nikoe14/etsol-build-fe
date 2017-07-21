# Front-End - Build - Dockerfile
#
# VERSION               0.0.1

FROM node

MAINTAINER Nicolás Espejo <nicolasgermanespejo@gmail.com>

RUN npm install -g bower
RUN npm install -g grunt
RUN echo hola

#Entrypoint
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

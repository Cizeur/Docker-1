#RUN WITH 
#docker build -t byotss .
FROM debian:latest

LABEL Author="cgiron"

ENV TS_FOLDER="/opt/teamspeak/"
ENV TS3SERVER_LICENSE=accept

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install --upgrade -y wget tar bzip2
WORKDIR /home
RUN wget https://files.teamspeak-services.com/releases/server/3.9.0/teamspeak3-server_linux_amd64-3.9.0.tar.bz2
RUN tar -xf teamspeak3-server_linux_amd64-3.9.0.tar.bz2
RUN rm -rf teamspeak3-server_linux_amd64-3.9.0.tar.bz2
RUN mv teamspeak3-server_linux_amd64 teamspeak
WORKDIR /home/teamspeak
EXPOSE 9987/udp 10011 30033
#ENTRYPOINT [ "bash" ]
ENTRYPOINT [ "./ts3server_minimal_runscript.sh"]

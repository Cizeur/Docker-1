#RUN WITH 
#docker build -t vim ex00
#docker run --rm --tty --interactive -v $(pwd)/:/home .

FROM alpine:latest
LABEL Author="cgiron"
RUN apk update
RUN apk upgrade 
RUN apk add vim
RUN apk add bash
WORKDIR /home
#CMD vim
#COUNTRARY TO CMD will ignore following cmd
ENTRYPOINT [ "vim" ]
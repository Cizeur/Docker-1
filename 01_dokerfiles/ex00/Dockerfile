#RUN WITH 
#docker build -t vim_image .
#docker run --rm --tty --interactive -v $(pwd)/:/home vim_image

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

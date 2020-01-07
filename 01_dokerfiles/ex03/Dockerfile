FROM debian:stretch-slim

    ## AVOID OPTIONAL INSTALLATIONS STOPS
    ENV DEBIAN_FRONTEND=noninteractive
   
    WORKDIR /home

    ## INSTALL PREREQUISITES
    RUN apt-get update -y
    RUN apt-get upgrade -y
    RUN apt-get install -y curl
    RUN apt-get install -y ca-certificates
    RUN apt-get install -y openssh-server
    RUN apt-get install -y postfix

    ## GITLAB INSTALL
    WORKDIR /tmp
    RUN curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
    RUN apt-get install -y gitlab-ce
    #RUN apt-get install -y certbot
    
    ##ADDING SSL CERTIFICATION
    RUN openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout gitlab.key -out gitlab.crt\
    -subj "/C=FR/ST=Everywhere/L=Nowhere/O=The internet/OU=ITea/CN=gitlab/emailAddress=cizeur@gitlab.com"
    RUN mkdir -p /etc/gitlab/ssl
    RUN mv gitlab.crt gitlab.key /etc/gitlab/ssl

    #nginx['custom_gitlab_server_config'] = \"location ^~ /.well-known { root /var/www/letsencrypt; }\"\n\
    #letsencrypt['enable'] = true                      # GitLab 10.5 and 10.6 require this option\n\
    RUN printf "\n\
    nginx['ssl_certificate'] = \"/etc/gitlab/ssl/gitlab.crt\"\n\
    nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/gitlab.key\"\n\
    nginx['redirect_http_to_https'] = true\n\
    gitlab_rails['gitlab_shell_ssh_port'] = 4222 \n\
    external_url \"https://127.0.0.1\"         # Must use https protocol " >> /etc/gitlab/gitlab.rb
    #CMD ["/bin/bash"]

    EXPOSE 22 80 44
    ENTRYPOINT service ssh start \
            && ( /opt/gitlab/embedded/bin/runsvdir-start & ) \
            && gitlab-ctl reconfigure \
            && gitlab-ctl tail
            #&& sleep infinity

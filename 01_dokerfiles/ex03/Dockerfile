FROM debian:stretch-slim

    ENV DEBIAN_FRONTEND=noninteractive
    WORKDIR /home
    RUN apt-get update -y
    RUN apt-get upgrade -y
    RUN apt-get install -y curl
    RUN apt-get install -y ca-certificates
    RUN apt-get install -y openssh-server
    RUN apt-get install -y postfix
    WORKDIR /tmp
    RUN curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
    RUN apt-get install -y gitlab-ce
    #RUN apt-get install -y certbot
    EXPOSE 22 80 443

    #nginx['custom_gitlab_server_config'] = \"location ^~ /.well-known { root /var/www/letsencrypt; }\"\n\
#    RUN printf "\n\
#letsencrypt['enable'] = true                      # GitLab 10.5 and 10.6 require this option\n\
#external_url \"https://127.0.0.1\"         # Must use https protocol " >> /etc/gitlab/gitlab.rb
    #CMD ["/bin/bash"]
    ENTRYPOINT service ssh start \
            && ( /opt/gitlab/embedded/bin/runsvdir-start & ) \
            && gitlab-ctl reconfigure \
            && gitlab-ctl tail
            #&& sleep infinity

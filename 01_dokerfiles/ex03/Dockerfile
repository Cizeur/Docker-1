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
    RUN apt-get install -y certbot
    RUN echo << END
    EXPOSE 22 80 443
    RUN printf "\n\
nginx['custom_gitlab_server_config'] = \"location ^~ /.well-known { root /var/www/letsencrypt; }\"\n\
letsencrypt['enable'] = true                      # GitLab 10.5 and 10.6 require this option\n\
external_url \"https://gitlab.example.com\"         # Must use https protocol\n\
letsencrypt['contact_emails'] = ['foo@email.com'] # Optional" >> /etc/gitlab/gitlab.rb
    #CMD ["/bin/bash"]
    ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) \
            && gitlab-ctl reconfigure \
            && sleep infinity

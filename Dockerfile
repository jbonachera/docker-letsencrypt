FROM fedora
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

RUN dnf install -y openssl && \
    dnf clean all
ADD https://raw.githubusercontent.com/lukas2511/letsencrypt.sh/master/letsencrypt.sh  /usr/local/bin/letsencrypt.sh
COPY letsencrypt_loop  /usr/local/bin/letsencrypt_loop
RUN chmod +x /usr/local/bin/letsencrypt_loop /usr/local/bin/letsencrypt.sh
RUN mkdir /etc/letsencrypt
CMD /usr/local/bin/letsencrypt_loop

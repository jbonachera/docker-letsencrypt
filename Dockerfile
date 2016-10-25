FROM jbonachera/arch
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

RUN pacman -S --noconfirm openssl
ADD https://raw.githubusercontent.com/lukas2511/dehydrated/master/dehydrated  /usr/local/bin/dehydrated
COPY letsencrypt_loop  /usr/local/bin/letsencrypt_loop
RUN chmod +x /usr/local/bin/letsencrypt_loop /usr/local/bin/dehydrated
RUN mkdir /etc/letsencrypt
CMD /usr/local/bin/letsencrypt_loop

FROM jbonachera/arch
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

ADD https://raw.githubusercontent.com/lukas2511/dehydrated/master/dehydrated  /usr/local/bin/dehydrated
COPY letsencrypt_loop  /usr/local/bin/letsencrypt_loop
COPY hook-* /usr/local/bin/
RUN chmod +x /usr/local/bin/letsencrypt_loop /usr/local/bin/dehydrated /usr/local/bin/hook-*
RUN mkdir /etc/letsencrypt
CMD /usr/local/bin/letsencrypt_loop

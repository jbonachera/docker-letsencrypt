FROM jbonachera/arch
MAINTAINER Julien BONACHERA <julien@bonachera.fr>
CMD /usr/local/bin/letsencrypt_loop
ADD https://raw.githubusercontent.com/lukas2511/dehydrated/master/dehydrated  /usr/local/bin/dehydrated
RUN pacman -S --noconfirm bind-tools git python-pip && \
    git clone https://github.com/kappataumu/letsencrypt-cloudflare-hook /usr/local/src/hooks/cloudflare && \
    cd /usr/local/src/hooks/cloudflare && \
    pip install -r requirements.txt && \
    pacman -Rcs --noconfirm  git python-pip
COPY hook-* /usr/local/bin/
RUN mkdir /etc/letsencrypt
COPY letsencrypt_loop  /usr/local/bin/letsencrypt_loop
RUN chmod +x /usr/local/bin/letsencrypt_loop /usr/local/bin/dehydrated /usr/local/bin/hook-*

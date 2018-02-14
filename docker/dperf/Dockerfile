FROM alpine:3.7


RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories  && \
    apk --update --no-cache  add tar bash libstdc++ bind-tools iputils busybox-extras && \
    apk --update --no-cache --force-broken-world add qperf@testing

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT [ "/entrypoint.sh" ]

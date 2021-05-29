FROM centos

ARG version=0.12.0
WORKDIR /writefreely

ADD https://github.com/writefreely/writefreely/releases/download/v${version}/writefreely_${version}_linux_amd64.tar.gz .
RUN tar -zxf writefreely_${version}_linux_amd64.tar.gz --strip-components=1 -C .
RUN mv /writefreely/writefreely /usr/bin/writefreely
RUN rm writefreely_${version}_linux_amd64.tar.gz

CMD [ "writefreely", "-c", "/writefreely/data/config.ini"]

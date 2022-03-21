FROM alpine
MAINTAINER symbolspace <symbolspace@outlook.com>

RUN apk add --update tzdata
ENV TZ=Asia/Shanghai

WORKDIR /
ENV FRP_VERSION 0.40.0

RUN set -x && \
	wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \ 
	tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
	cd frp_${FRP_VERSION}_linux_amd64 && \
	mkdir /frp && \
	mv frpc /frpc && \
    mv frpc.ini /frp/frpc.ini && \
	cd .. && \
	rm -rf *.tar.gz && \
	rm -rf frp_${FRP_VERSION}_linux_amd64

VOLUME /frp

CMD /frpc -c /frp/frpc.ini
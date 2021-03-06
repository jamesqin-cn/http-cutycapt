FROM golang AS builder
ADD . /go/src/github.com/jamesqin-cn/docker-http-cutycapt/
RUN cd /go/src/github.com/jamesqin-cn/docker-http-cutycapt \
  && go get -v \
  && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .


FROM centos
MAINTAINER QinWuquan <jamesqin@vip.qq.com>
COPY --from=builder /go/src/github.com/jamesqin-cn/docker-http-cutycapt/app /bin/app
RUN yum install -y epel-release \
  && yum install -y Xvfb \
  && yum install -y xorg-x11-fonts* \
  && yum install -y google-noto-sans-simplified-chinese-fonts.noarch \
  && yum install -y mesa-dri-drivers \
  && yum install -y CutyCapt \
  && rm -rf /var/cache/yum \
  && dbus-uuidgen > /var/lib/dbus/machine-id
ENTRYPOINT ["/bin/app"]
CMD ["-alsologtostderr"]

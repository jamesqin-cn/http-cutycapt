FROM golang AS builder
RUN go get -v github.com/jamesqin-cn/docker-cutycapt \
  && cd /go/src/github.com/jamesqin-cn/docker-cutycapt \
  && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .


FROM centos
MAINTAINER QinWuquan <jamesqin@vip.qq.com>
COPY --from=builder /go/src/github.com/jamesqin-cn/docker-cutycapt/app /bin/app
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

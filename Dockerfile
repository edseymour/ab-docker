FROM  centos:latest
MAINTAINER Ed Seymour <eseymour@redhat.com>
RUN yum update -y && yum -y install httpd-tools && yum clean all
ENTRYPOINT ["/usr/bin/ab"]

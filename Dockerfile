FROM  centos:latest
MAINTAINER Ed Seymour <eseymour@redhat.com>
LABEL description="Apache Bench with optional ENV configuration - see https://github.com/edseymour/ab-docker"
RUN yum update -y && yum -y install httpd-tools && yum clean all
ADD start-test.sh /start-test.sh
RUN chmod 555 /start-test.sh
ENTRYPOINT ["/start-test.sh"]

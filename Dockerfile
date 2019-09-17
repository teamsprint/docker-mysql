FROM teamsprint/hadoop:2.7.3

MAINTAINER Jooho Kim

USER root

RUN wget http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
RUN yum -y localinstall mysql57-community-release-el7-7.noarch.rpm
RUN yum repolist enabled | grep "mysql.*-community.*"
RUN yum -y install mysql-community-server mysql mysql-libs mysql-devel mysql-server
RUN rm -f mysql57-community-release-el7-7.noarch.rpm

RUN yum -y install expect

ADD start-mysql.sh /
ADD init-pw.sh /
ADD connect.sh /

CMD ["/bin/bash"]

# MySQL port
EXPOSE 3306


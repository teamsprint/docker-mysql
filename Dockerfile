FROM teamsprint/hadoop:2.7.3

MAINTAINER Jooho Kim

USER root

RUN wget http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm \
        && yum -y localinstall mysql57-community-release-el7-7.noarch.rpm \
        && yum repolist enabled | grep "mysql.*-community.*" \
        && yum -y install mysql-community-server mysql \
        && rm -f mysql57-community-release-el7-7.noarch.rpm

RUN yum -y install expect

ADD script/init-mysql.sh /
ADD script/start-mysql.sh /
ADD script/conn-mysql.sh /
ADD script/stop-mysql.sh /

ADD Dockerfile /
ADD README.md /

CMD ["/bin/bash"]

# MySQL port
EXPOSE 3306


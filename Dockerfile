FROM tomcat:7.0.91-jre7

MAINTAINER helion@mendanha.com.br

LABEL name="Oviyam-2.7.4" \
   vendor="CentOS" \
   license="GPLv2" \
   build-date="20210114"

ADD files/Oviyam-2.7.4-bin.zip /opt

RUN apt-get install curl unzip

WORKDIR  /

RUN mkdir -p /ovitmp \
	&& cd /ovitmp \
    && mv /opt/Oviyam-2.7.4-bin.zip . \
    && unzip Oviyam-2.7.4-bin.zip \
    && rm -R /usr/local/tomcat/webapps/ROOT/ \
    && cp /ovitmp/Oviyam-2.7.4-bin/Oviyam-2.7.4-bin/oviyam2.war /usr/local/tomcat/webapps/ROOT.war \
    && cp /ovitmp/Oviyam-2.7.4-bin/tomcat/*.jar  /usr/local/tomcat/lib
	
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

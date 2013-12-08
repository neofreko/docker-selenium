FROM phusion/baseimage:0.9.1
MAINTAINER Akhmad Fathonih "akhmadf@gmail.com"

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -q -y openjdk-7-jre-headless xvfb bzip2 firefox

ADD ./install /
ADD http://selenium.googlecode.com/files/selenium-server-standalone-2.35.0.jar /srv/
ADD http://selenium.googlecode.com/files/selenium-server-standalone-2.31.0.jar /srv/

ADD https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/24.2.0esr/linux-x86_64/en-US/firefox-24.2.0esr.tar.bz2 /srv/firefox-24/
RUN ls -l /srv/firefox-24
RUN cd /srv/firefox-24 && tar jxvf firefox-24.2.0esr.tar.bz2 

ADD https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/25.0.1/linux-x86_64/en-US/firefox-25.0.1.tar.bz2 /srv/firefox-25/
RUN cd /srv/firefox-25 && tar jxvf firefox-25.0.1.tar.bz2

EXPOSE 4444

CMD ["/usr/local/bin/start-selenium-server.sh"]

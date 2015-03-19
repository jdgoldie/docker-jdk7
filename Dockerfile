#
# A Dockerfile to create an Oracle JDK7 container.
# Copyright(c) 2015 Joshua Goldie
# Provided under MIT license (http://opensource.org/licenses/MIT)
#  
FROM ubuntu:14.10

#
# Add packages/install java-7-oracle
#
RUN \
	echo "deb http://archive.ubuntu.com/ubuntu utopic universe" >> /etc/apt/sources.list; \
	apt-get install -y software-properties-common sudo; \
	add-apt-repository -y ppa:webupd8team/java; \
	apt-get update -y; \
	echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections; \
	apt-get install -y oracle-java7-installer; \
	apt-get -y clean; \
	update-java-alternatives -s java-7-oracle; \
	echo "export JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> ~/.bashrc; \
	echo "export JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment; \
	java -version
	


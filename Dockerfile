FROM ubuntu:14.04

# Allows to add external repositories
RUN sudo apt-get install software-properties-common -y

# Add and refresh external repositories
RUN add-apt-repository -y ppa:webupd8team/java
RUN add-apt-repository -y ppa:cwchien/gradle
RUN apt-get update

# Install latest Java 8 build
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN ["java", "-version"]

# Install latest Gradle build
RUN apt-get install -y gradle
RUN ["gradle", "-v"]

# Install other tools
RUN sudo apt-get -y install zip
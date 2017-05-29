from akhilrajmailbox/ubuntu:16.04
maintainer Akhil Raj <akhilrajmailbox@gmail.com>

run apt-get update && apt-get upgrade -y \
        && apt-get install -y nano apt-utils net-tools dnsutils wget unzip openssh-server openssh-client git \
        software-properties-common \
        --no-install-recommends \
        && add-apt-repository ppa:webupd8team/java -y \
        && apt-get update -y \
        && echo debconf shared/accepted-oracle-license-v1-1 select true | \
        debconf-set-selections \
        && echo debconf shared/accepted-oracle-license-v1-1 seen true | \
        debconf-set-selections \
        && apt-get install oracle-java8-installer -y \
        --no-install-recommends \
        && apt install oracle-java8-set-default

run wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add - \
        && sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

run apt-get update && apt-get install jenkins sudo -y
run usermod -aG sudo jenkins
run sh -c 'echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'

expose 8080
env JAVA_HOME /usr/lib/jvm/java-8-oracle
env JAVA_OPTS "-Xmx4096m"
env PATH $PATH:$JAVA_HOME/bin

entrypoint chown -R  jenkins:jenkins /var/lib/jenkins && /etc/init.d/jenkins start && tailf /var/log/jenkins/jenkins.log

FROM centos:7 

ARG RUBY_VERSION=2.5.0
RUN yum install epel-release -y && \
    yum install -y openssl-devel readline-devel zlib-devel gcc bzip2 vim git make && yum clean all -y 

ENV PATH=$PATH:/opt/rbenv/bin
RUN git clone https://github.com/rbenv/rbenv.git /opt/rbenv
RUN rbenv install ${RUBY_VERSION}
ADD entrypoint.sh /opt/run/entrypoint.sh
ENTRYPOINT /opt/run/entrypoint.sh



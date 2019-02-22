FROM centos:7 

ARG RUBY_VERSION=2.5.0
RUN yum install epel-release -y && \
    yum install -y openssl-devel readline-devel zlib-devel gcc bzip2 vim git make && yum clean all -y 

ENV PATH=$PATH:/opt/rbenv/bin
RUN git clone https://github.com/rbenv/rbenv.git /opt/rbenv  
RUN mkdir -p /opt/rbenv/plugins
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build 
RUN /opt/rbenv/plgins/ruby-build/install.sh

RUN rbenv install ${RUBY_VERSION}
ADD entrypoint.sh /opt/run/entrypoint.sh
ENTRYPOINT /opt/run/entrypoint.sh



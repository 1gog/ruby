FROM centos:7 

ARG RUBY_VERSION=2.5.0
RUN echo "build ${RUBY_VERSION}"
RUN yum install epel-release -y && \
    yum install -y openssl-devel postgresql-libs postgresql-devel postgresql readline-devel zlib-devel gcc bzip2 vim git make && yum clean all -y 

ENV PATH=$PATH:/opt/rbenv/bin
RUN git clone https://github.com/rbenv/rbenv.git /opt/rbenv  
RUN mkdir -p /opt/rbenv/plugins
RUN ls -la /opt/rbenv/bin
ENV RBENV_ROOT=/opt/rbenv
ENV RUBY_VERSION="${RUBY_VERSION}"
RUN eval "$(rbenv init -)"
RUN rbenv root
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build 
RUN /opt/rbenv/plugins/ruby-build/install.sh

RUN rbenv install ${RUBY_VERSION}
ADD entrypoint.sh /opt/run/entrypoint.sh
ENTRYPOINT /opt/run/entrypoint.sh



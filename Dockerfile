FROM fatherlinux/centos5-base

RUN yum -y install make curl cmake unzip gcc openssl openssl-devel zlib zlib-devel
RUN curl -sOL https://downloads.mariadb.org/f/mariadb-10.0.15/source/mariadb-10.0.15.tar.gz && \
    tar zxf mariadb-10.0.15.tar.gz
RUN cmake mariadb-10.0.15 && make mroonga


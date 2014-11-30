FROM fatherlinux/centos5-base

RUN yum -y install make curl cmake unzip gcc patchutils gcc-c++ openssl ncurses-devel ncurses openssl-devel zlib zlib-devel bison
RUN curl -sOL https://downloads.mariadb.org/f/mariadb-10.0.15/source/mariadb-10.0.15.tar.gz && \
    tar zxf mariadb-10.0.15.tar.gz
RUN cd /mariadb-10.0.15 && cmake . 
ADD ./grn_expr_allow_column.patch /grn_expr_allow_column.patch
RUN cd /mariadb-10.0.15/storage/mroonga && patch -p0 < /grn_expr_allow_column.patch
RUN cd /mariadb-10.0.15 && make mroonga

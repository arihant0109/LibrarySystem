FROM mysql:8.0
ENV MYSQL_DATABASE=librarydb
ENV MYSQL_ROOT_PASSWORD=root
COPY init.sql /docker-entrypoint-initdb.d/

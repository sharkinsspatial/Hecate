FROM mdillon/postgis:9.6-alpine 
COPY ./schema.sql /docker-entrypoint-initdb.d/
ENV POSTGRES_USER hecate 
ENV POSTGRES_PASSWORD password 
ENV POSTGRES_DB hecatedb

FROM java:9-jdk AS build

MAINTAINER Simon Marti <simon.marti@inventage.com>

WORKDIR /opt/sslpoke

COPY ["SSLPoke.java", "/opt/sslpoke/"]
RUN javac SSLPoke.java


FROM java:9-jre

MAINTAINER Simon Marti <simon.marti@inventage.com>

ENV TRUST_STORE_PATH=/opt/sslpoke/truststore.jks \
    TRUST_STORE_PASSWORD= \
    KEY_STORE_PATH=/opt/sslpoke/keystore.jks \
    KEY_STORE_PASSWORD= \
    DEBUG=ssl,handshake,record

WORKDIR /opt/sslpoke
ENTRYPOINT ["/opt/sslpoke/docker-entrypoint.sh"]
CMD []

# See https://github.com/docker-library/openjdk/issues/101
ENV JAVA_CONF_DIR=$JAVA_HOME/conf
RUN bash -c '([[ ! -d $JAVA_SECURITY_DIR ]] && ln -s $JAVA_HOME/lib $JAVA_HOME/conf) || (echo "Found java conf dir, package has been fixed, remove this hack"; exit -1)'

COPY ["docker-entrypoint.sh", "/opt/sslpoke/"]
COPY --from=build ["/opt/sslpoke/SSLPoke.class", "/opt/sslpoke/"]

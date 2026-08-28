FROM docker.io/sonatype/nexus3:3.95.3-alpine@sha256:c0b9c4a98e231a5865f67a07cea477c13bd3d5f3cac67746afa28622f9c15296
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

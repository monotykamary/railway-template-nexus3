FROM docker.io/sonatype/nexus3:3.97.2-alpine@sha256:5a90cc609f47d1461282a314fbb78906a5d84c8961d515902e46e357c7278471
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

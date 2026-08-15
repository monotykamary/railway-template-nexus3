FROM docker.io/sonatype/nexus3:3.95.1-alpine@sha256:bb0b5bc23314e3854895f538b358e10d903445ef590cdb15c5a2cc18e12738b7
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

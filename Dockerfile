FROM docker.io/sonatype/nexus3:3.95.0-alpine@sha256:c47083c9e77d87cd7f7c1111a68b53e758644deb54aba2235c8de1b40eebb09a
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

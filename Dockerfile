FROM docker.io/sonatype/nexus3:3.96.4-alpine@sha256:5f48f9085096e96f4111ec07d79d57ca5a4a1da5a2003a3028a0b60c62bea7d1
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

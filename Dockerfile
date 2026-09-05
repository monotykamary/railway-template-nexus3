FROM docker.io/sonatype/nexus3:3.96.0-alpine@sha256:56f8e1d241507338be1f91c9de9a9b97d72a7376f0404f6c1e914b542c983f75
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

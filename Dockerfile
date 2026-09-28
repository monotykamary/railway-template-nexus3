FROM docker.io/sonatype/nexus3:3.96.2-alpine@sha256:2d849910b28bef3016d55ed9fd72d1f3981bf4e4a1b68ce536efa8f6efe107bd
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

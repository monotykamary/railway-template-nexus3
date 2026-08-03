FROM docker.io/sonatype/nexus3:3.94.1-alpine@sha256:18f9642c3a46dece37d6b36c8afe467f33759a73264ae9d7a5b46f3eba9532d6
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

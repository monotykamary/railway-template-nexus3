FROM docker.io/sonatype/nexus3:3.96.3-alpine@sha256:a406f4e9dc149e050723a93bf57964311f6d1c88e1dcbed2e42ea373319a1772
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

FROM docker.io/sonatype/nexus3:3.95.2-alpine@sha256:adb4539e29bcb1c91e5545c853f6c74da5e57efd4c243aa4d5454f309904ab13
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

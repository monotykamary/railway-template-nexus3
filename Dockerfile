FROM docker.io/sonatype/nexus3:3.97.0-alpine@sha256:772ad5badde07e15f2c25c750437fcbb01ebdb84a8c43a3ed38eda60bb6448f1
USER root
RUN apk add --no-cache su-exec
COPY entrypoint.sh /usr/local/bin/nexus-railway-entrypoint
RUN chmod +x /usr/local/bin/nexus-railway-entrypoint
EXPOSE 8081
ENTRYPOINT ["/usr/local/bin/nexus-railway-entrypoint"]

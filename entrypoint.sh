#!/bin/sh
set -eu
: "${NEXUS_ADMIN_PASSWORD:?NEXUS_ADMIN_PASSWORD is required}"
mkdir -p /nexus-data
chown -R 200:200 /nexus-data
if [ -f /nexus-data/.railway-admin-configured ]; then
  exec su-exec nexus /opt/sonatype/nexus/bin/nexus run
fi
su-exec nexus /opt/sonatype/nexus/bin/nexus run &
pid=$!
trap 'kill -TERM "$pid" 2>/dev/null || true; wait "$pid"' TERM INT
ready=0
for i in $(seq 1 180); do
  if curl -fsS http://127.0.0.1:8081/service/rest/v1/status >/dev/null 2>&1 && [ -s /nexus-data/admin.password ]; then ready=1; break; fi
  sleep 5
done
[ "$ready" = 1 ] || { echo 'Nexus bootstrap timed out' >&2; exit 1; }
initial=$(cat /nexus-data/admin.password)
curl -fsS -u "admin:$initial" -X PUT -H 'Content-Type: text/plain' --data-binary "$NEXUS_ADMIN_PASSWORD" http://127.0.0.1:8081/service/rest/v1/security/users/admin/change-password >/dev/null
curl -fsS -u "admin:$NEXUS_ADMIN_PASSWORD" -X PUT -H 'Content-Type: application/json' --data '{"enabled":false,"userId":"anonymous","realmName":"NexusAuthorizingRealm"}' http://127.0.0.1:8081/service/rest/v1/security/anonymous >/dev/null
touch /nexus-data/.railway-admin-configured
chown 200:200 /nexus-data/.railway-admin-configured
wait "$pid"

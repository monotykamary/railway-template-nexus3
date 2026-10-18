# Nexus Repository on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/nexus-repository?referralCode=ZqgrJ0)

Deploy Sonatype Nexus Repository 3.97.0 with a generated administrator password, anonymous access disabled, and daily-backed-up artifact storage. The verified button is added after publication.

Sign in as `admin` with `NEXUS_ADMIN_PASSWORD`, read and explicitly accept the Community Edition EULA in the onboarding wizard, then create repositories. The template does not accept legal terms on your behalf. The artifact smoke test also refuses to accept them unless an operator explicitly sets `ACCEPT_NEXUS_EULA=true` after reading the linked EULA. Data persists at `/nexus-data`. This is a memory-intensive, one-replica embedded-database topology; allocate at least 2 GB RAM and do not scale horizontally.

From 3.97.0 Nexus sends required [baseline telemetry](https://help.sonatype.com/en/nexus-repository-telemetry.html) to Sonatype, Community Edition included, and an administrator must acknowledge it in the onboarding wizard; the template does not acknowledge it for you. If uploads to `nxrm.telemetry.sonatype.com` keep failing for 10 days, Nexus becomes read-only until one succeeds. Upgrading from 3.96.x migrates the embedded database one way: back up `/nexus-data` first.

Upstream: https://github.com/sonatype/nexus-public/tree/release-3.97.0-13 (EPL-1.0). Sonatype and Nexus are trademarks of Sonatype, Inc.; not affiliated with Railway.

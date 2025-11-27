# NetworkHealthCheck

- Puts the contents of `ping` into Postgres every minute. That's it.
- `docker compose up` to start.
- The DDL in [startup-scripts/schema.sql](./startup-scripts/schema.sql) will only be run if the data directory (in this case, the docker volume) is
empty.
  - See [the docs](https://hub.docker.com/_/postgres#initialization-scripts)



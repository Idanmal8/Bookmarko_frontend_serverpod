# bookmarko_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker compose up --build --detach

To run tables script do this:

docker compose -f docker-compose-deploy.yaml run -T --rm postgres env PGPASSWORD="MJhDm5mHr7_KswU48AiWKczMGywA6N-I" psql -h postgres -U postgres -d bookmarko < generated/tables-serverpod.pgsql

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker compose stop

## bookmarko_server
## Welcome to the bookmarko_server setup guide. This README will guide you through the process of setting up and running your Serverpod server using Docker, including database setup and accessing pgAdmin.

## Prerequisites
## Ensure you have Docker and Docker Compose installed on your system.

## Steps to Run the Server
## Start Docker Containers:

## Run the following command to start your Postgres, Serverpod, and pgAdmin containers:

docker-compose up --build --detach

## This command builds and starts the containers defined in your docker-compose.yml.
## Set Up the Database Tables:

## To create tables in the Postgres database, run the following commands for your SQL scripts:

docker-compose -f docker-compose.yaml run -T --rm postgres env PGPASSWORD="MJhDm5mHr7_KswU48AiWKczMGywA6N-I" psql -h postgres -U postgres -d bookmarko < generated/tables-serverpod.pgsql

docker-compose -f docker-compose.yaml run -T --rm postgres env PGPASSWORD="MJhDm5mHr7_KswU48AiWKczMGywA6N-I" psql -h postgres -U postgres -d bookmarko < generated/tables.pgsql
These commands run the SQL scripts tables-serverpod.pgsql and tables.pgsql against the Postgres database.

## Start the Serverpod Server:
If needed, start the Serverpod server manually:

dart bin/main.dart

## This command starts the Serverpod server.

## Access pgAdmin:
## Open a web browser and navigate to http://localhost:5050.
## Log in with the email admin@admin.com and the password admin.
## You can now manage your Postgres database using pgAdmin.
## Stopping the Containers:
docker-compose stop
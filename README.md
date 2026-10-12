# Foodbank Inventory

## Requirements

- Ruby 3.4.11 and Bundler
- Docker with Docker Compose
- Node.js 22 or newer and Yarn 1.22.22

## Setup

Install Ruby and JavaScript dependencies and start the local PostgreSQL server:

```sh
bundle install
yarn install --frozen-lockfile
docker compose up -d --wait db
bin/rails db:prepare
```

The Rails application runs on the host and connects to PostgreSQL 18 on `localhost:5432`, matching Heroku's default major version. Compose keeps development data in a named volume. The local database credentials are for development only; configure `DB_HOST`, `DB_PORT`, `DB_USERNAME`, and `DB_PASSWORD` to override them.

PostgreSQL 17 data volumes are not upgraded automatically. When upgrading an existing local database, dump its data from PostgreSQL 17 and restore it into PostgreSQL 18; the previous Compose volume is left untouched.

Start the application and asset watchers with `bin/dev`.

## Tests

Start the same PostgreSQL service, then run the Rails and system test suites:

```sh
docker compose up -d --wait db
bin/rails test
bin/rails test:system
```

Tests use the separate `foodbank_inventory_test` database. Parallel test workers create their own databases from it; the Compose database user has permission to create them.

System tests (E2E) use headless Chrome by default, including in GitHub Actions. To run with a visible browser window locally, set `HEADLESS=false`:

```sh
HEADLESS=false bin/rails test:system
```

## Production

Production also uses PostgreSQL. On Heroku, Active Record uses the platform-provided `DATABASE_URL`; do not commit production credentials.

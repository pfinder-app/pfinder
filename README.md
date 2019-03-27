# Pfinder

## Setup

Voraussetzungen:

- Docker und Docker Compose

Datenbank einrichten:
```
docker-compose run backend bin/rails db:create db:migrate db:seed
```

## Applikation starten

```
docker-compose up
```

Die Applikation ist nun unter http://localhost:3000 erreichbar

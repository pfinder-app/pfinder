# Pfinder

## Setup

Voraussetzungen:

- Docker und Docker Compose

Container builder:

```
docker-compose build
```

Datenbank einrichten:

```
docker-compose run backend bin/rails db:setup
```

## Applikation starten

```
docker-compose up
```

Die Applikation ist nun unter http://localhost:3000 erreichbar

# Pfinder Backend

## Setup

Voraussetzungen:

- Ruby (Version siehe `.ruby-version`)
- PostgreSQL
- Bundler (`gem install bundler`)

Abhängigkeiten installieren:

```
bundle install
```

Datenbank einrichten:


```
rails db:setup
```

## Applikation starten

```
bundle exec puma
```

Die Applikation ist nun unter http://localhost:3000 erreichbar

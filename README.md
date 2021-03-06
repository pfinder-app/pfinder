# Pfinder

## Backend (API)

### Setup

Prerequisites:

- Docker and Docker Compose

#### Database Setup

```
docker-compose run backend bin/rails db:drop db:create db:migrate db:seed
docker-compose -c docker-compose.yml -c docker-compose.test.yml run backend bin/rails db:drop db:create
```

#### Reset Database
```
docker-compose run backend bin/rails db:reset
```

### Start Backend

```
docker-compose up

```

### Run Tests
```
docker-compose -c docker-compose.yml -c docker-compose.test.yml run backend bin/check
```

The backend is now available at: http://localhost:3009


## Frontend (App)

### Setup

Install global CLI tools
```
npm install -g @vue/cli
npm install -g ionic
```

Install app dependencies
```
cd frontend
npm install
```

### Compile, serve and hot-reload for development
```
cd frontend
ionic serve
```

The application will be available at: http://localhost:8100

### Build for iOS

Run
```
cd frontend
ionic cordova build ios
```

Then open a new XCode project with file `frontend/platforms/ios/Pfinder.xcodeproj`

Run or build the app from within XCode.

### Lints and fixes files
```
cd frontend
npm run lint
```



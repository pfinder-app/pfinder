FROM marcoturi/ionic
# FROM ruby:2.6.1-alpine
# RUN apk add --no-cache --update build-base \
#   linux-headers \
#   git \
#   nodejs \
#   yarn \
#   tzdata
RUN mkdir -p /app
WORKDIR /app

COPY package.json /app/
COPY package-lock.json /app/
RUN npm install

# COPY package.json /app/
# COPY yarn.lock /app/
# RUN yarn install

COPY . /app

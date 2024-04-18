FROM node:18.12.0-alpine3.16 as build

WORKDIR /app

COPY package.json ./package.json
COPY package.json ./package.json
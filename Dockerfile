FROM node:18-alpine as build


WORKDIR /app
COPY package.json ./package.json
COPY package-lock.json ./package-lock.json

RUN npm install

COPY . ./

RUN npm run build

# CMD [ "npm", "run", "preview" ]
FROM nginx:1.23.2-alpine as start

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

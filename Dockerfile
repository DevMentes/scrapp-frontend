FROM node:lts-alpine  AS build

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json /usr/src/app

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.14-alpine

COPY --from=build /usr/src/app/dist/ /usr/share/nginx/html

COPY www/nginx.config /etc/nginx/conf.d/default.conf
FROM node:11-alpine as Build

WORKDIR /usr/src/app

COPY package.json /usr/src/app

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.14-alpine

COPY --from=Build /usr/src/app/dist /usr/share/nginx/html

COPY www/nginx.config /etc/nginx/conf.d/default.conf
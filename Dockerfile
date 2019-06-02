FROM node:10-alpine

WORKDIR /usr/src/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.14-alpine

COPY --from=build /usr/src/app/dist/ /usr/share/nginx/html

COPY www/nginx.config /etc/nginx/conf.d/default.conf
FROM node:14 as builder

WORKDIR '/app'

COPY package*.json .

RUN npm install


COPY . .

CMD npm build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
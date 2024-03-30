FROM node:14-alpine

WORKDIR /app

COPY . .

RUN yarn install

EXPOSE 3001

CMD [ "yarn", "start" ]
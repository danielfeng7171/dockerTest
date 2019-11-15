FROM node:12-alpine

ENV NODE_VERSION 12.13.0

# modify timezone
RUN apk add --no-cache tzdata
ENV TZ Asia/Taipei

# copy my project
RUN mkdir /dockerTest
COPY package.json /dockerTest/
COPY src /dockerTest/src
WORKDIR /dockerTest
RUN npm install

# start
CMD npm start

FROM node:20.19-alpine AS builder

USER root
WORKDIR /app
COPY /ui .

RUN npm install
RUN npm run build

CMD ["npm", "start", "--", "--host", "0.0.0.0", "--poll", "500"]
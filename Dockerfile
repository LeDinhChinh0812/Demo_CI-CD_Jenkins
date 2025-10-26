FROM node:20-alpine
WORKDIR /app

ARG BUILD_REV=dev
LABEL build_rev=$BUILD_REV

COPY package*.json ./
RUN npm install --omit=dev
COPY . .
EXPOSE 3000
CMD ["node", "src/server.js"]

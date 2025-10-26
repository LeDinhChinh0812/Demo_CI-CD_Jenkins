FROM node:20-alpine
WORKDIR /app

# Cài deps trước để tận dụng cache
COPY package*.json ./
RUN npm ci --omit=dev


# Copy mã nguồn
COPY . .


EXPOSE 3000
CMD ["node", "src/server.js"]
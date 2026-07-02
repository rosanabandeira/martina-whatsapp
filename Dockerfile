FROM node:20-alpine
WORKDIR /app
RUN apk add --no-cache wget python3 make g++ openssl
RUN wget -qO- https://github.com/atendai/evolution-api/archive/refs/heads/main.tar.gz | tar xz --strip-components=1
RUN npm install --legacy-peer-deps
RUN npm run build
EXPOSE 8080
CMD ["node", "dist/main.js"]

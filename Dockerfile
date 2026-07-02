FROM node:20-alpine
WORKDIR /app
RUN apk add --no-cache git python3 make g++ openssl
RUN git clone --depth 1 https://github.com/atendai/evolution-api.git .
RUN npm install --legacy-peer-deps
RUN npm run build
EXPOSE 8080
CMD ["node", "dist/main.js"]

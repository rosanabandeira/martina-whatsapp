FROM node:20-alpine
WORKDIR /app
RUN apk add --no-cache wget python3 make g++ openssl
RUN wget -qO- https://github.com/evolution-foundation/evolution-api/archive/refs/heads/main.tar.gz | tar xz --strip-components=1
RUN npm install --legacy-peer-deps
RUN cp prisma/postgresql-schema.prisma prisma/schema.prisma && npx prisma generate
RUN npm run build
EXPOSE 8080
CMD ["sh", "-c", "npx prisma migrate deploy && node dist/main.js"]

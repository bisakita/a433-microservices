# Menggunakan Image node:v14 dari docker registry
FROM node:14-alpine

# Mengubah workdir pada /app
WORKDIR /app

# Copy semua data pada folder /app
COPY ./ ./

# Sintak untuk memasang env build production dan db host item-db
ENV NODE_ENV=production DB_HOST=item-db

# Sintak untuk install dependeny dan build project
RUN npm install --production --unsafe-perm && npm run build

# Expose port 8080 sesuai pada file nodejs
EXPOSE 8080

# Run aplikasi
ENTRYPOINT ["npm", "start"]
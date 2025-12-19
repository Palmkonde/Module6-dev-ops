FROM node:24-slim as builder 
WORKDIR /app

COPY package.json .
RUN npm install

FROM node:24-alpine
WORKDIR /app
COPY --from=builder /app/node_modules /node_modules
COPY index.js .

EXPOSE 4444
CMD ["node", "index.js"]

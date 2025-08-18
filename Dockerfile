# Stage 1: Build React app
FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve with "serve"
FROM node:22-alpine
WORKDIR /app

# Install "serve"
RUN npm install -g serve

# Copy build output
COPY --from=build /app/dist ./dist

# Railway provides $PORT automatically
EXPOSE 3000
CMD ["sh", "-c", "serve -s dist -l ${PORT}"]

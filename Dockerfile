# ==========================
# Stage 1: Build the Vite app
# ==========================
FROM node:22 AS build

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Build the Vite app (outputs to /app/dist)
RUN npm run build


# ==========================
# Stage 2: Serve with Nginx
# ==========================
FROM nginx:alpine

# Copy build output from Stage 1 to Nginx's html directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

# Step 1: Use Node.js base image
FROM node:20-alpine

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy package files and install dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Step 4: Copy the rest of the source code
COPY . .

# Step 5: Build Next.js app
RUN npm run build

# Step 6: Expose the port
EXPOSE 3000

# Step 7: Start Next.js
CMD ["npm", "start"]

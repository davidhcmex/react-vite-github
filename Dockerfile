# Stage 1: Build the Vite app
FROM node:20-alpine as builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app's source code
COPY . .

# Build the Vite app (make sure this matches your project's build script)
RUN npm run build

# Stage 2: Serve the app using Nginx
FROM nginx:stable-alpine as production

# Copy built assets from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80 (ensure this matches your local port mapping)
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

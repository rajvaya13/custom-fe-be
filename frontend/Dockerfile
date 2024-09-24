# Use the official Node.js image as a base
FROM node:18-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code to the container
COPY . .

# Build the React application for production
RUN npm run build

# Use a lightweight server to serve the built files
FROM nginx:alpine

# Copy the build output from the previous stage to the Nginx HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port on which Nginx will run
EXPOSE 80

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]

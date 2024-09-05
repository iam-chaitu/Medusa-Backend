# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the project
RUN npm run build

# Expose the port Medusa runs on
EXPOSE 9000

# Define environment variable for production
ENV NODE_ENV=production

# Start the Medusa server
CMD ["npm", "start"]

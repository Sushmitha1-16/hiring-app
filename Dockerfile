 # Use official Node.js LTS image as base
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app code
COPY . .

# Expose the app port (change if using a different one)
EXPOSE 3000

# Start the Node.js application
CMD ["npm", "start"]

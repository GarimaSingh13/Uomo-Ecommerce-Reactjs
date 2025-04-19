# Use a lightweight Node.js image
FROM node:alpine

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies (production dependencies for efficiency)
RUN npm install --production

# Copy the app files
COPY . .

# Build the React app
RUN npm run build

# Expose the port (optional if you're using a different port)
EXPOSE 3000

# Use serve to serve the built app for production
RUN npm install -g serve

# Command to run the app using 'serve' for serving static files
CMD ["serve", "-s", "build", "-l", "3000"]


# Step 1: Use an official Node.js image from the Docker Hub as the base image
FROM node:18-alpine

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy the package.json and package-lock.json (if available) to the working directory
COPY package*.json ./

# Step 4: Install dependencies (npm ci ensures a clean install)
RUN npm ci --only=production

# Step 5: Copy the rest of the application code to the container's working directory
COPY . .

# Step 6: Expose the port the app runs on (make sure this matches your app's port)
EXPOSE 3000

# Step 7: Define the command to run your application (adjust if different)
CMD [ "npm", "start" ]

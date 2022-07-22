# Pull official base image of node
FROM node:16-alpine

# RUN mkdir /app

# Set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Install app dependencies
COPY package*.json ./

RUN npm install --silent
RUN npm install react-scripts@4.0.3 -g --silent

# Copy from current project directory to potential project directory of Docker image/container
COPY . .

EXPOSE 3000

# Start app or run React development server
CMD ["npm", "start"]

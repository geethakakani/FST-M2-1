# Specify Base Image
FROM docker.io/node:18-alpine
 # Work Directory
WORKDIR /usr/app
 # copy the package to the container
 COPY ./package.json ./
# Install Dependencies
RUN npm install
#copy the rest of the files
 COPY ./ ./
# Startup Command
CMD ["npm", "start", "serve"]
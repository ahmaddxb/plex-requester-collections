FROM node:20-slim
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY . .

# --- NEW DEBUGGING STEP ---
# List the files and directories to confirm they were copied correctly.
RUN find . -maxdepth 2

RUN npm run build

CMD [ "node", "dist/index.js" ]
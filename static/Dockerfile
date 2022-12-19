# First stage, build the application
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build


# Second stage, copy the artifacts in a new stage and 
# build the image
FROM node:lts-alpine
WORKDIR /app
COPY --from=build-stage /app/build /app
RUN npm install -g serve

EXPOSE 3000
CMD ["serve", "-s", "/app"]

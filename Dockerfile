FROM node:lts-alpine AS build
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build

FROM httpd:alpine AS runtime
COPY --from=build /app/dist /usr/local/apache2/htdocs/

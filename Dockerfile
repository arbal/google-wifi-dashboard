# build stage
FROM node:12-alpine as build-stage
# WORKDIR /app
WORKDIR /google-wifi-dashboard
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /google-wifi-dashboard/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# FROM node:12-alpine
# RUN apk add git
# RUN git clone https://github.com/arbal/google-wifi-dashboard
# WORKDIR /google-wifi-dashboard
# EXPOSE 8080
# RUN npm install
# CMD ["npm", "run", "serve"]


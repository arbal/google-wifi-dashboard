FROM node:12-alpine
RUN apk add git
RUN git clone https://github.com/tobyworks/google-wifi-dashboard/google-wifi-dashboard
WORKDIR /google-wifi-dashboard
EXPOSE 8080
RUN npm install
CMD ["npm", "run", "serve"]


FROM node:lts-alpine as build-stage
#test
ARG VUE_APP_API_BASE_URL

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

RUN echo "VUE_APP_API_BASE_URL=${VUE_APP_API_BASE_URL}" > .env.production
RUN cat .env.production

RUN npm run build

# этап production (production-stage)
FROM nginx:stable-alpine as production-stage
COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

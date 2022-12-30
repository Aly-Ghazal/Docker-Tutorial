 FROM node:16-alpine as builder
     WORKDIR /app
     copy package*.json ./
     RUN npm install 
     copy . . 
     RUN npm run build

     FROM nginx:1.21.0-alpine
     COPY --from=builder /app/build /usr/share/nginx/html
     EXPOSE 80
     CMD ["nginx", "-g", "daemon off;"]
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json /app
RUN npm install 
COPY . .
# creates /app/build folder that contains all the stuff to run the app
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
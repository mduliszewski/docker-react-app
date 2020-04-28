FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# the previous block was ended because the 'FROM' command appeard (one block can have 1 FROM command)

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default nginx command runs nginx for us so we dont have to specify any RUN command

